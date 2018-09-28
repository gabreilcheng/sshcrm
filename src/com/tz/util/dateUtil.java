/**  
  
 * @Title: dateUtil.java 
  
 * @Package com.tz.util 
  
 * @Description: TODO(用一句话描述该文件做什么) 
  
 * @author liyicheng  
  
 * @date 2018年8月24日 下午2:49:41 
  
 * @version V1.0  
  
 */ 
package com.tz.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**   
 * @ClassName: dateUtil   
 * @Description: TODO(这里用一句话描述这个类的作用)   
 * @author liyicheng   
 * @date 2018年8月24日 下午2:49:41      
 */

public class dateUtil {

	public static Date parseDate(String  date){
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		Date dd = null;
		try {
			dd = s.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dd;
	}
	
	
	
	public static void main(String[] args) throws ParseException {
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println((parseDate("2014-02-01")));
	}
}
