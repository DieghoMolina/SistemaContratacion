/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;
//marvinnclkxckmsx
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
 * @author Alexander_Arrué
 */
public class ProcesarCurriculum extends HttpServlet {

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
        
        CrudCurriculum crud = new CrudCurriculum();
        Curriculum cur = new Curriculum();
        RequestDispatcher rd = null;
       
          cur.setIdCurriculum(Integer.parseInt(request.getParameter("codigo")));
            cur.setCurriculum(request.getParameter("curri"));
            cur.setFechaModi(request.getParameter("fechamodi"));
            cur.setIdCandidato(Integer.parseInt(request.getParameter("candidato")));
        try
        {
          
            
            if(request.getParameter("btnInsertar")!= null)
            {
                crud.insertarCurriculum(cur);
              
            }
            
            else if(request.getParameter("btnModificar")!=null)
            {
                crud.modificarCurriculum(cur); 
                
            }
             
            else if(request.getParameter("btnEliminar")!=null)
            {
                crud.eliminarCurriculum(cur);
              
            }
              rd=request.getRequestDispatcher("/admin/dashboard/pcurriculum.jsp");
            
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
