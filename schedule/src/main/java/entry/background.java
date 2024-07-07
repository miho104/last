package entry;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/background")
public class background extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String[] imageFiles = {
        "images/大学のキャンパス（早朝）.jpg",
        "images/大学のキャンパス（日中）.jpg",
        "images/大学のキャンパス（夕方）.jpg",
        "images/大学のキャンパス（夜・灯りあり）.jpg",
        "images/大学のキャンパス（夜・灯りなし）.jpg"
    };
    private int currentImageIndex = 0;
    private Timer timer;

    @Override
    public void init() throws ServletException {
        super.init();

        // 初期画像を設定
        setInitialBackgroundImage();

        // タイマーを設定して指定した時刻に画像を変更
        timer = new Timer();
        for (int hour : new int[]{4, 7, 16, 18, 22}) {
            scheduleImageChange(hour, 0);
        }
    }

    private void scheduleImageChange(int hour, int minute) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, hour);
        calendar.set(Calendar.MINUTE, minute);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Date time = calendar.getTime();
        // 時刻が過去の場合は翌日に設定
        if (time.before(new Date())) {
            calendar.add(Calendar.DAY_OF_MONTH, 1);
            time = calendar.getTime();
        }

        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                updateImageIndex(hour);
            }
        }, time, 24 * 60 * 60 * 1000); // 24時間ごとに実行
    }

    private void updateImageIndex(int hour) {
        switch (hour) {
            case 4:
                currentImageIndex = 0; // 早朝
                break;
            case 7:
                currentImageIndex = 1; // 日中
                break;
            case 16:
                currentImageIndex = 2; // 夕方
                break;
            case 18:
                currentImageIndex = 3; // 夜・灯りあり
                break;
            case 22:
                currentImageIndex = 4; // 夜・灯りなし
                break;
        }
    }

    private void setInitialBackgroundImage() {
        Calendar now = Calendar.getInstance();
        int currentHour = now.get(Calendar.HOUR_OF_DAY);

        if (currentHour >= 22 || currentHour < 4) {
            currentImageIndex = 4; // 夜・灯りなし
        } else if (currentHour >= 18) {
            currentImageIndex = 3; // 夜・灯りあり
        } else if (currentHour >= 16) {
            currentImageIndex = 2; // 夕方
        } else if (currentHour >= 7) {
            currentImageIndex = 1; // 日中
        } else {
            currentImageIndex = 0; // 早朝
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 画像ファイル名をセッション属性に設定
    	String imagefile="a.png";
        request.getSession().setAttribute("backgroundImage", imagefile);

        // JSPにリダイレクト
        response.sendRedirect("login.jsp");
    }
}
