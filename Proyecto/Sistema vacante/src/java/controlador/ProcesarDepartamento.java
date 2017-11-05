
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/**
 *
 * @author palacios
 */
public class ProcesarDepartamento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        CrudDepto cdd=new CrudDepto();
        Depto dt=new Depto();
        RequestDispatcher rd=null;
        String val=null;
        
       
        dt.setNombre(request.getParameter("nombre"));
         try
        {
          
            
            if(request.getParameter("btnInsertar")!= null)
            {
                cdd.insertarDepto(dt);
                val="Datos insertados correctamente";
            }
            
            else if(request.getParameter("btnModificar")!=null)
            {
                cdd.modificarDepto(dt);
                val="Datos modificados correctamente";
            }
             
            else if(request.getParameter("btnEliminar")!=null)
            {
                cdd.eliminarDepto(dt);
                val="Datos eliminados correctamente";
              
            }
              rd=request.getRequestDispatcher("/admin/dashboard/pdepartamento.jsp");
              request.setAttribute("valor", val);
            
        }catch(Exception e){
            request.setAttribute("Error", e.toString());
        }
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
