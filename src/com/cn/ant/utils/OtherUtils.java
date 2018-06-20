package com.cn.ant.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class OtherUtils {
	public static String getOrderId(){
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
        Calendar c = Calendar.getInstance();
        String orderId = sf.format(c.getTime());
        for(int i=0;i<4;i++){
        	orderId += (int)(Math.random()*10);
        }
        //System.out.println(orderId);
		return orderId;
	}
	
	public static void main(String[] args) {
		getOrderId();
	}
	
}
