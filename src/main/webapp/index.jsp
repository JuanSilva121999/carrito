<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.producto"%>
<%
    if(session.getAttribute("almacen")==null){
        ArrayList<producto> lisaux = new ArrayList<producto>();
        
        session.setAttribute("almacen", lisaux);
        
    }
    ArrayList<producto> almacen= (ArrayList<producto>)session.getAttribute("almacen");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Carrito de compras</h1>
        <form action="MainServlet" method="post">
            <table>
                    <tr>
                        <td>Id</td>
                        <td><input type="text" name="id"value="0" size="2"></td>
                    </tr>
                    <tr>
                        <td>Producto</td>
                        <td><input type="text" name="producto" value=""></td>
                    </tr>
                    <tr>
                        <td>Cantdad</td>
                        <td><input type="text" name="cantidad" value="0"></td>
                    </tr>
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="precio" value="0"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Procesar"></td>
                    </tr>
            </table>

        </form>
        <a href="MainServlet?op=vaciar">Vaciar Carrito</a>
        <h2>Contenido del carrito</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>PRODUCTO</th>
                <th>CANTIDAD</th>
                <th>PRECIO</th>
                <th></th>
            </tr>
            <%
                if(almacen!=null){
                    for (producto p : almacen){
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getProducto() %></td>
                <td><%= p.getCantidad() %></td>
                <td><%= p.getPrecio() %></td>
                <td><a href="MainServlet?op=eliminar&id=<%= p.getId()%>">X</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>
