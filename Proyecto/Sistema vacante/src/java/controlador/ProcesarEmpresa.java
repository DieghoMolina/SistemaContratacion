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
import modelo.CrudEmpresa;
import modelo.Empresa;

/**
 *
 * @author CASA
 */
public class ProcesarEmpresa extends HttpServlet {

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
        
        Empresa emp = new Empresa();
        CrudEmpresa crud = new CrudEmpresa();
        RequestDispatcher rd= null;
        String val=null;
        
        try
        {
           
           
           if(request.getParameter("btnInsertar")!=null)
           {
              emp.setNombre(request.getParameter("nombre"));
              emp.setDescripcion(request.getParameter("descripcion"));
           emp.setLogo(request.getParameter("logo"));
               emp.setIdDepto(Integer.parseInt(request.getParameter("departamento")));
               emp.setIdMunicipio(Integer.parseInt(request.getParameter("municipio")));
               emp.setIdTipoEmpresa(Integer.parseInt(request.getParameter("Tempresa")));
               emp.setIdUsuario(Integer.parseInt(request.getParameter("user")));
               crud.insertarEmpresa(emp);
               val="Datos Insertados Correctamente";
           }
           
            if(request.getParameter("btnModificar")!=null)
           {
                emp.setIdEmpresa(Integer.parseInt(request.getParameter("codigo")));
                emp.setNombre(request.getParameter("nombre"));
                emp.setDescripcion(request.getParameter("descripcion"));
                 emp.setLogo(request.getParameter("logo"));
           
                emp.setIdDepto(Integer.parseInt(request.getParameter("departamento")));
                emp.setIdMunicipio(Integer.parseInt(request.getParameter("municipio")));
                emp.setIdTipoEmpresa(Integer.parseInt(request.getParameter("Tempresa")));
                emp.setIdUsuario(Integer.parseInt(request.getParameter("user")));
               crud.modificarEmpresa(emp);
               val="Datos Modificados Correctamente";
           }
            
             if(request.getParameter("btnEliminar")!=null)
           {
               emp.setIdEmpresa(Integer.parseInt(request.getParameter("codigo")));
               crud.eliminarEmpresa(emp);
               val="Datos Eliminados Correctamente";
           }
             rd = request.getRequestDispatcher("admin/dashboard/pempresa.jsp");
             request.setAttribute("Valor", val);
        }catch(Exception e)
        {
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
