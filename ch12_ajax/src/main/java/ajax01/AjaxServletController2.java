package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.json.simple.*;

public class AjaxServletController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// v1. 응답데이터가 하나의 문자열일 때
		/*
		String responseData = "name : " + name + " / age : " + age; 
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(responseData);
		*/
		
		// v2. 응답데이터가 여러개 일 때
		/*
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().print(name);
		response.getWriter().print(age);
		*/
		
		// v3. 응답데이터가 여러개 일 때 json이나 배열로 반환
		/*
			JSON(JavaScript Object Notation : 자바스크립트 객체 표기법)
			- ajax 통신시 데이터를 전송에 자주 사용되는 포맷형식 중 하나
			
			> [value, value, value] => 자바스크립에서의 배열 객체 => JSONArray
			> {key:value, key:value} => 자바스크립에서의 일반 객체 => JSONArray
		 */
		
		// v3.1 JSONArray 배열로 반환
		/*
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
		//response.setContentType("text/html; charset=utf-8");
		// --> ex) ["값1", 10] 전체를 문자열로 들어가기 때문에 index[0] = [ , index[1] = " 이렇게 표시   
		response.setContentType("application/json; charset=utf-8");
		// --> 따라서 집어넣은 값 만들 배열로 가지고 활용하려면 type을 위 처럼 json으로 해줘야함
		response.getWriter().print(jArr);
		*/
		
		// v3.2 JSONObject 객체로 반환
		JSONObject jObj = new JSONObject();
		jObj.put("name", name);
		jObj.put("age", age);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
