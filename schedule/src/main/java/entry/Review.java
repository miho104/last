package entry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Review")
public class Review extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int day = Integer.parseInt(request.getParameter("day"));
        int period = Integer.parseInt(request.getParameter("period"));
        String review = request.getParameter("review");

        String[][] reviews = (String[][]) request.getSession().getAttribute("reviews");
        if (reviews == null) {
            reviews = new String[5][6];
        }
        reviews[day][period] = review;
        request.getSession().setAttribute("reviews", reviews);
        // レビュー保存後、list.jspにリダイレクト
        response.sendRedirect("list.jsp");
    }
}
