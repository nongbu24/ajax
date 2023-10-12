package com.ajax.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	private static final String serviceKey = "Ym%2BmoBAWcRuKVboT2B%2FI%2Fgxw79m%2FSodALP2wKOokarkTEOKXE8TsxIBx3LSWxmCOQNcjDVn1Okb88PS6k4p3rA%3D%3D";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("[HomeController] home method has been called");
		
		return "home";
	}
	
	@ResponseBody //요청한 페이지를 그대로 돌려줄 수 있는 아노테이션
	@RequestMapping(value = "/parking.do", produces="application/json; charset=UTF-8")
	public String query() throws Exception {
		System.out.println("[HomeController] query method");
		String url = "http://apis.data.go.kr/B551177/StatusOfParking/getTrackingParking";
		url += "?serviceKey=" + serviceKey;
		url += "&numOfRows=" + URLEncoder.encode("10", "UTF-8");
		url += "&pageNo=" + URLEncoder.encode("1");
		url += "&type=" + URLEncoder.encode("json");
		
		URL requestURL = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestURL.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null)
			responseText += line;
		
		System.out.println(responseText);
		br.close();
		urlConnection.disconnect();
		
		return responseText; 
	}
	
}