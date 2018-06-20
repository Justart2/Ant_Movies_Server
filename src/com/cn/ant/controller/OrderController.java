package com.cn.ant.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.ant.entity.MovieHall;
import com.cn.ant.entity.MovieShow;
import com.cn.ant.entity.Order;
import com.cn.ant.entity.User;
import com.cn.ant.service.interf.IMovieHallInterface;
import com.cn.ant.service.interf.IOrderInterface;
import com.cn.ant.utils.DateUtils;
import com.cn.ant.utils.OtherUtils;
import com.google.gson.Gson;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource
	IMovieHallInterface movieHallInterf;
	@Resource
	IOrderInterface orderInterf;
	/**
	 * 选座之后订单生成
	 * */
	@RequestMapping("/get_order.do")
	public String getOrder(HttpServletRequest request){
		/*获取订单信息*/
		MovieShow movieShow = (MovieShow) request.getSession().getAttribute("movie_show_for_seat");
		String seatChose = request.getParameter("seat");
		String priceAcount = request.getParameter("acount");
		User user = (User)request.getSession().getAttribute("user_info");
		//String[] seat = seatChose.split(",");
		/*修改座位信息*/
		String oldSeat = movieShow.getMoviehall().gethSeat();
		String[] t = oldSeat.split(";");
		String[][] s = new String[t.length][t[0].length()];
		for(int i=0;i<t.length;i++){
			for(int j = 0;j<t[i].length();j++){
				s[i][j] = t[i].charAt(j)+"";
			}
		}
		
		String seatInfo = "";
		String seat[] = seatChose.split(",");
		for(int i=0;i<seat.length;i++){
			int x = Integer.parseInt(seat[i].split("\\.")[0]);
			int y = Integer.parseInt(seat[i].split("\\.")[1]);
			s[x][y] = "1";
			seatInfo += "【"+(x+1)+"排,"+(y+1)+"座】";
		}
		
		String newSeat = "";
		for(int i=0;i<t.length;i++){
			for(int j = 0;j<t[i].length();j++){
				newSeat += s[i][j];
			}
			newSeat += ";";
		}
		System.out.println(oldSeat);
		System.out.println(newSeat);
		System.out.println(seatInfo);
		MovieHall movieHall = new MovieHall();
		movieHall.sethId(movieShow.getMoviehall().gethId());
		movieHall.sethSeat(newSeat);
		/*修改数据库*/
		movieHallInterf.changeSeat(movieHall);
		
		/*添加信息入订单表*/
		Order order = new Order();
		order.setoId(OtherUtils.getOrderId());
		order.setuId(8);//后期传登录用户id
		order.setsId(movieShow.getsId());
		order.setoTicketCount(seat.length);
		order.setoPrice(Double.parseDouble(priceAcount));
		order.setoSeatInfo(seatInfo);
		order.setoTime(DateUtils.getCurrentDateTime());
		order.setoState("待支付");
		/*插入数据库*/
		orderInterf.insertOrder(order);
		request.setAttribute("order_info", order);
		//System.out.println(s[i][j]);
		return "movie-payment";
	}
	/**
	 * 查询用户所有订单
	 * */
	@RequestMapping("/user_order.do")
	public String getUserOrder(HttpServletRequest request){
		int userId = Integer.parseInt(request.getParameter("user_id"));
		List<Order> list = orderInterf.getUserOrder(userId);
		request.setAttribute("user_order", list);
		return "user_order";
	}
	
	/**
	 * Android端订单生成
	 * 
	 * */
	@RequestMapping("/android_insert_order.do")
	public void setAndroidUserOrder(HttpServletRequest request,HttpServletResponse response) throws Exception{
		/*request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");*/
		int userId = Integer.parseInt(request.getParameter("user_id"));
		int movieShowId = Integer.parseInt(request.getParameter("movie_show_id"));
		System.out.println(movieShowId);
		String orderCode = request.getParameter("order_code");
		double orderPrice = Double.parseDouble(request.getParameter("order_price"));
		String orderState = request.getParameter("order_state");
		String seatServicetag = request.getParameter("seat_service_info");
		
		String time = DateUtils.getCurrentDateTime();
		/*添加信息入订单表*/
		Order order = new Order();
		order.setoId(orderCode);
		order.setuId(userId);
		order.setsId(movieShowId);
		order.setoPrice(orderPrice);
		order.setoSeatInfo(seatServicetag);
		order.setoTime(time);
		order.setoState(orderState);
		/*插入数据库*/
		orderInterf.insertOrder(order);
		
		/*修改座位信息*/
		/*取出座位信息*/
		List<Order> orderList = orderInterf.getOrderByMovieShowId(movieShowId);
		int movieHallId = orderList.get(0).getMovieShow().getMoviehall().gethId();
		String oldSeat = orderList.get(0).getMovieShow().getMoviehall().gethSeat();
		String[] t = oldSeat.split(";");
		String[][] s = new String[t.length][t[0].length()];
		for(int i=0;i<t.length;i++){
			for(int j = 0;j<t[i].length();j++){
				s[i][j] = t[i].charAt(j)+"";
			}
		}
		
		String seat[] = seatServicetag.split(";");
		for(int i=0;i<seat.length;i++){
			int x = Integer.parseInt(seat[i].split(",")[0]);
			int y = Integer.parseInt(seat[i].split(",")[1]);
			s[x][y] = "1";
		}
		
		String newSeat = "";
		for(int i=0;i<t.length;i++){
			for(int j = 0;j<t[i].length();j++){
				newSeat += s[i][j];
			}
			newSeat += ";";
		}
		System.out.println(oldSeat);
		System.out.println(newSeat);
		MovieHall movieHall = new MovieHall();
		movieHall.sethId(movieHallId);
		movieHall.sethSeat(newSeat);
		/*修改数据库*/
		int result = movieHallInterf.changeSeat(movieHall);
		
		PrintWriter out = response.getWriter();
		if(result==1){
			out.print("succeed");
			out.flush();
		}else{
			out.print("error");
			out.flush();
		}
		out.close();
	}
	/**
	 * 查询用户所有订单
	 * */
	@RequestMapping("/android_user_order.do")
	public void getAndroidUserOrder(HttpServletRequest request,HttpServletResponse response)throws Exception{
		int userId = Integer.parseInt(request.getParameter("user_id"));
		List<Order> list = orderInterf.getUserOrder(userId);
		String result = "";
		if(list.size()>0){
			Gson gson = new Gson();
			result = gson.toJson(list);
		}
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
	/**
	 * 删除用户的订单
	 * */
	@RequestMapping("/android_delete_user_order.do")
	public void deleteUserOrderById(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String  orderId = request.getParameter("order_id");
		int result = orderInterf.deleteOrderById(orderId);
		PrintWriter out = response.getWriter();
		if(result==1){
			out.print("succeed");
			out.flush();
		}else{
			out.print("error");
			out.flush();
		}
		
		out.close();
	}
}
