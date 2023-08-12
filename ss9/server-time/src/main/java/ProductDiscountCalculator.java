import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "CalculateServlet", value = "/Calculate")
public class ProductDiscountCalculator extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float Price  = Float.parseFloat(request.getParameter("LP"));
        float Percent = Float.parseFloat(request.getParameter("DP"));
        String Descrip = request.getParameter("PD");

        float DiscountAmount = (float) (Price * Percent * 0.01);
        float DiscountPrice = DiscountAmount + Price;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Descrip :"+ Descrip +"</h1>");
        writer.println("<h1>Percent :"+ Percent +"</h1>");
        writer.println("<h1>Price :"+ Price +"</h1>");
        writer.println("<h1>Discount Amount :"+ DiscountAmount +"</h1>");
        writer.println("<h1>Discount Price :"+ DiscountPrice +"</h1>");
        writer.println("</html>");
    }
}
