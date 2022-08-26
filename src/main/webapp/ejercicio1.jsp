<%@include file="/plantilla/menu.jspf" %>

<body>
<div class="container mt-2">
    <h1>Ejercicio #1</h1>
</div>

<form action="ejercicio1.jsp" method="POST">
    <div class="container mt-2">
        <label for="lbl_num_txt">Ingrese un número entre 0 y 1000</label><br>
        <input type="text" name="N_Usuario" placeholder="Ingresa un número" value="0">
        <button type="submit" class="btn-secondary" name="Enviar">Enviar</button>
    </div>
    <%
        if (request.getParameter("Enviar") != null) {

            int numeroU = Integer.parseInt(request.getParameter("N_Usuario"));
            int aleatorio = (int) (Math.random() * 1000);
            int contador = 0;
            String dat = request.getParameter("lblInfo");

            do {
                if (aleatorio > numeroU) {
                    dat = "Ingresa un número mayor";
                } else if (aleatorio < numeroU) {
                    dat = "Ingresa un número menor";
                } else if (numeroU == aleatorio) {
                    dat = "Has acertado, felicidades!! el número era: " + aleatorio;
                }
                contador++;
            } while (numeroU != aleatorio || contador <= 10);
        }
    %>

</form>
</body>



