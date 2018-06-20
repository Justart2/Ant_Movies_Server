package com.cn.ant.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
	public static String getCurrentDate() {

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        String date = sf.format(c.getTime());
        //System.out.println(date);
		return date;
	}
	
	public static String getCurrentDateTime() {

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar c = Calendar.getInstance();
		return sf.format(c.getTime());
	}
	public static String getTommrrowDate(){
		 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar c = Calendar.getInstance();
	        //System.out.println("当前日期："+sf.format(c.getTime()));
	        c.add(Calendar.DAY_OF_MONTH, 1);
	        //System.out.println("增加一天后日期 :"+sf.format(c.getTime()));
	        return sf.format(c.getTime());
	}
	
	public static String getAddDate(int a){
		 SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar c = Calendar.getInstance();
	        //System.out.println("当前日期："+sf.format(c.getTime()));
	        c.add(Calendar.DAY_OF_MONTH, 2);
	        //System.out.println("增加一天后日期 :"+sf.format(c.getTime()));
	        return sf.format(c.getTime());
	}
	
	public static String getYMDHMS(String date){
		String newDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(date));
		return newDate;
	}
	
	public static void main(String[] args) {
		//System.out.println(getYMDHMS("Sun May 01 00:00:00 CST 2016"));
		//getCurrentDateTime();
		//getTommrrowDate();
		getCurrentDate();
	}
	
}
