<%@include file="/plantilla/menu.jspf" %>
<%@page import="Banco.Cuenta" %>
<%@page import="Banco.Interes" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>


<body>
<div class="container mt-2">
    <h1>Ejercicio #2</h1>
    <div class="container mt-4">
        <div class="row">

            <h3>Crear cuenta</h3>
            <form action="ejercicio2.jsp" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingrese nombre... "
                           required>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="cuenta" id="cuenta" placeholder="Ingrese cuenta... "
                           required>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="saldo" id="saldo" placeholder="Ingrese saldo... "
                           required>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="tiempo" id="tiempo"
                           placeholder="Ingrese años de la cuenta... " required>
                </div>
                <div class="form-group">
                    <label for="interes">Seleccione el interes</label>
                    <select class="form-control" name="interes">
                        <% for (Interes i : Interes.values()) {%>
                        <option value="<%=i%>"><%=i%> - <%=i.getP()%>
                        </option>
                        <% } %>
                    </select>
                </div>
                <button type="submit" name="EnviarInfo" class="btn btn-secondary">Crear</button>
            </form>


            <%
                if (request.getParameter("EnviarInfo") != null) {
                    Cuenta cu = new Cuenta(
                            request.getParameter("nombre"),
                            request.getParameter("cuenta"),
                            Double.parseDouble(request.getParameter("saldo")),
                            Interes.valueOf(request.getParameter("interes")),
                            Double.parseDouble(request.getParameter("tiempo"))
                    );

                    if (session.getAttribute("ListaCuentas") != null) {
                        List<Cuenta> lCuenta = (List<Cuenta>) session.getAttribute("ListaCuentas");
                        lCuenta.add(cu);

                        session.setAttribute("ListaCuentas", lCuenta);
                    } else {
                        List<Cuenta> lCuenta = new ArrayList<Cuenta>();
                        lCuenta.add(cu);

                        session.setAttribute("ListaCuentas", lCuenta);
                    }
                }
            %>
        </div>
        <br>
        <br>
        <div class="row">
            <h3>Transacción</h3>
            <form action="ejercicio2.jsp" method="post">
                <div class="form-group">
                    <label for="cuentaSeleccionar">Seleccione la cuenta</label>
                    <select class="form-control" name="cuentaSeleccionar">


                        <%
                            if (request.getParameter("EnviarInfo") != null || request.getParameter("LeerInfo") != null) {
                                List<Cuenta> lCuenta = (List<Cuenta>) session.getAttribute("ListaCuentas");

                                for (int i = 0; i < lCuenta.size(); i++) {%>
                        <option class="form-control"
                                value="<%=lCuenta.get(i).obtenerCuenta()%>"><%=lCuenta.get(i).obtenerCuenta()%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="transaccion">Transacción
                    </label>
                    <select class="form-control" name="transaccion">
                        <option value="1" selected>Retiro</option>
                        <option value="2">Deposito</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="number" class="form-control" name="monto" placeholder="Ingrese el monto..." value="0">
                </div>
                <button type="submit" name="LeerInfo" class="btn btn-secondary">Procesar</button>
            </form>
        </div>


        <%
            Cuenta cliente = null;
            if (request.getParameter("LeerInfo") != null) {

                List<Cuenta> lCuentas = (List<Cuenta>) session.getAttribute("ListaCuentas");

                String cuentaSelecionada = request.getParameter("cuentaSeleccionar");

                cliente = null;

                for (int x = 0; x < lCuentas.size(); x++) {
                    if (lCuentas.get(x).obtenerCuenta().equals(cuentaSelecionada)) {
                        cliente = lCuentas.get(x);
                        break;
                    }
                }
            }
        %>
        <% if (request.getParameter("LeerInfo") != null) {%>
        <div>
            <div class="card text-center">
                <div class="card-header">

                    Cliente: <%=cliente.obtenerNombre()%> - Cuenta: <%=cliente.obtenerCuenta()%>

                </div>
                <div class="card-body">
                    <p class="card-text">Monto ingresado: <%=request.getParameter("monto")%>
                    </p>
                    <p class="card-text">Saldo anterior: <%=cliente.obtenerSaldo()%>
                    </p>
                    <%
                        cliente.transaccion(
                                request.getParameter("transaccion"),
                                Double.parseDouble(request.getParameter("monto"))
                        );
                    %>
                    <p class="card-text">Saldo total: <%=cliente.obtenerSaldo()%>
                    </p>
                    <p class="card-text">Tipo de interes: <%=cliente.obtenerTipoDeInteres()%>
                        - <%=cliente.obtenerTipoDeInteres().getP()%>
                    </p>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</div>
</body>
