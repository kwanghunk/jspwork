package ajax01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import org.json.simple.*;

import com.google.gson.Gson;

public class AjaxServletController6 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// response.setContentType("text/html; charset=utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		ArrayList<Member> alist = new MemberMgr().getAllMember();
		
		// 1. JSONArray [{}, {}, {}]
		/*
		JSONArray jArr = new JSONArray();
		for(Member m : alist) {
			JSONObject jobj = new JSONObject();
			jobj.put("id", m.getId());
			jobj.put("name", m.getName());
			jobj.put("gender", m.getGender());
			jobj.put("email", m.getEmail());
			jArr.add(jobj);
		}
		response.getWriter().print(jArr);
		*/
		
		// 2. GSON 
		new Gson().toJson(alist, response.getWriter());
	}

}
