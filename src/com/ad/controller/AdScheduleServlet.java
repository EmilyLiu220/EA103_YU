//package com.ad.controller;
//
//import java.io.*;
//import java.util.*;
//import javax.servlet.*;
//import javax.servlet.http.*;
//import com.ad.model.*;
//
//public class AdScheduleServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	Timer timer ; 
//    int count = 0;        
//    public void destroy(){
//        timer.cancel();
//    }
//    
//    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
//    }
//            
//    public void init(){        
//        timer = new Timer();
////        Calendar rightnow = Calendar.getInstance();
//        Calendar cal = new GregorianCalendar(2020, Calendar.OCTOBER, 19, 0, 0, 0);        
//        TimerTask task = new TimerTask(){
//                   
//            public void run(){
//            	java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
//            	java.sql.Date todayTemp = java.sql.Date.valueOf(today.toString());
//            	AdService adSvc = new AdService();
//                List<AdVO> adlistVO = adSvc.getAll();
//                for(AdVO adVO : adlistVO) {
//                	java.sql.Date adUpTemp = java.sql.Date.valueOf(adVO.getAd_add_date().toString());
//                	java.sql.Date adDownTemp = java.sql.Date.valueOf(adVO.getAd_re_date().toString());
//                	if(adUpTemp.after(todayTemp)) {
//                		adSvc.updateAd_sts(adVO.getAd_no(), adVO.getEmp_no(), new Integer(0), adVO.getAd_add_date(), adVO.getAd_re_date());
//                	} else if(adDownTemp.before(todayTemp)) {
//                		adSvc.updateAd_sts(adVO.getAd_no(), adVO.getEmp_no(), new Integer(0), adVO.getAd_add_date(), adVO.getAd_re_date());
//                	} else {
//                		adSvc.updateAd_sts(adVO.getAd_no(), adVO.getEmp_no(), new Integer(0), adVO.getAd_add_date(), adVO.getAd_re_date());
//                	}
//                	
//                	
////                	if(adUpTemp.equals(todayTemp)) {
////                		adSvc.updateAd(adVO.getAd_no(), adVO.getEmp_no(),adVO.getAd_title() ,adVO.getAd_cont(), adVO.getAd_add_date(), adVO.getAd_re_date(), adVO.getAd_img(), new Integer(1));
////                	}
////                	if(adDownTemp.before(todayTemp)) {
////                		adSvc.updateAd(adVO.getAd_no(), adVO.getEmp_no(),adVO.getAd_title() ,adVO.getAd_cont(), adVO.getAd_add_date(), adVO.getAd_re_date(), adVO.getAd_img(), new Integer(2));
////                	}
//                }
////            	System.out.println("This is Task"+ count);
////                System.out.println("工作排定的時間 = " + new Date(scheduledExecutionTime()));
////                System.out.println("工作執行的時間 = " + new Date() + "\n");                
////                count++;
//            }
//        };
//        timer.scheduleAtFixedRate(task, cal.getTime(), 24*60*60*1000); 
//    }
//}
