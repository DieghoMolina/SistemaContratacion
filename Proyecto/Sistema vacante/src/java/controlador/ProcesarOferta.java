/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
 * @author diego
 */
public class ProcesarOferta extends HttpServlet {

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
        
        RequestDispatcher rd=null;
        Oferta ofer=new Oferta();
        CrudOferta cdof=new CrudOferta();
        
        ofer.setIdoferta(Integer.parseInt(request.getParameter("codigo")));
        ofer.setNombre(request.getParameter("nombre"));
        ofer.setDescripcion(request.getParameter("descripcion"));
        ofer.setSalario(Double.parseDouble(request.getParameter("salario")));
        ofer.setVacante(Integer.parseInt(request.getParameter("vacante")));
        ofer.setEdadRequerida(request.getParameter("edadr"));
        ofer.setExpRequerida(Integer.parseInt(request.getParameter("experienciar")));
        ofer.setGeneroRequerido(request.getParameter("generor"));
        ofer.setTipoContratacion(request.getParameter("tipoc"));
        ofer.setIdEmpresa(Integer.parseInt(request.getParameter("empresar")));
        
        try 
        {
            if(request.getParameter("btnInsertar")!=null)
            {
                cdof.InsertarOferta(ofer);
                
            }
            else if(request.getParameter("btnModificar")!=null)
            {
                cdof.ModificarOferta(ofer);
                
            }
            else if(request.getParameter("btnEliminar")!=null)
            {
                cdof.EliminarOferta(ofer);
                
            }
            rd=request.getRequestDispatcher("/admin/dashboard/poferta.jsp");
        } 
        catch (Exception e) 
        {
            request.setAttribute("error", e.toString());
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
