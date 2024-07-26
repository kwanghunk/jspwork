package ajaxReply;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.google.gson.Gson;

import ajax01.Member;
import ajax01.MemberMgr;

public class AjaxServletReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json; charset=utf-8");
		
		int ref = Integer.parseInt(request.getParameter("bnum"));
		ArrayList<Reply> alist = new ReplyDao().getReplyList(ref);
		System.out.println("ref : " + ref);
		System.out.println("alist.size() : " + alist.size());
		new Gson().toJson(alist, response.getWriter());
	}

}
