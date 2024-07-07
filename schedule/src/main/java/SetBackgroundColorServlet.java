package entry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SetBackgroundColorServlet")
public class SetBackgroundColorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 背景色を設定
        String bgColor = request.getParameter("bgColor");
        if (bgColor != null) {
            request.getSession().setAttribute("bgColor", bgColor);
        }
        // entry.jspにリダイレクト
        response.sendRedirect("entry.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
