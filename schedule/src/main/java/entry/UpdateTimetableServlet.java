package entry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTimetableServlet")
public class UpdateTimetableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8"); // 追加
        response.setCharacterEncoding("UTF-8"); // 追加
        String dayStr = request.getParameter("day");
        String periodStr = request.getParameter("period");
        String subject = request.getParameter("subject");

        int day = dayStr != null ? Integer.parseInt(dayStr) : -1;
        int period = periodStr != null ? Integer.parseInt(periodStr) : -1;

        String[][] timetable = (String[][]) request.getSession().getAttribute("timetable");
        if (timetable == null) {
            timetable = new String[5][6];
        }

        if (day >= 0 && day < 5 && period >= 0 && period < 6) {
            timetable[day][period] = subject;
        }

        request.getSession().setAttribute("timetable", timetable);
        response.sendRedirect("entry.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}