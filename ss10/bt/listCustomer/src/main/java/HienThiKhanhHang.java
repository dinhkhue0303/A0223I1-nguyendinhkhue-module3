import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HTKHServlet", value = "/customer")
public class HienThiKhanhHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<KhachHang> list = new ArrayList<>();
        KhachHang kh1 = new KhachHang("khue","10","diachi1","https://cafefcdn.com/thumb_w/640/203337114487263232/2022/3/3/photo1646280815645-1646280816151764748403.jpg");
        KhachHang kh2 = new KhachHang("khang","11","diachi2","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR27xeCg3sl3D0U9177p1Rf-KhvF3Uaoz-sOA&usqp=CAU");
        KhachHang kh3 = new KhachHang("lan","12","diachi3","https://icdn.dantri.com.vn/thumb_w/680/2023/01/24/khoa-hocdocx-1674520013659.png");
        list.add(kh1);
        list.add(kh2);
        list.add(kh3);
        request.setAttribute("list", list);
        RequestDispatcher rq = request.getRequestDispatcher("HienThiKhachHang.jsp");
        rq.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
