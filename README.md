<div align="center" style="">
    <img src="utilitarios/logo-senai.png" 
         alt="Texto alternativo" 
         title="Gerenciamento De Peças e Pedidos"/>
</div>
<br>
<br>
<br>
<div align="center">
    <img src="utilitarios/logo-gpp2.png" style="margin-right: 85px;" alt="Texto alternativo" />
</div>

<br>
<h2>Sistema de Gerenciamento de Peças e Pedidos</h2>
<h3> 1 - Visão Geral do Software </h3>

<p>
O sistema de assistência técnica terceirizada é uma solução implementada por uma empresa para fornecer suporte após a venda. Os dados do cliente e do produto são enviados ao sistema gerando a nota fiscal da empresa para que caso ocorra algum problema, será a partir desta nota fiscal que será iniciado o atendimento. Técnicos qualificados são designados para lidar com o suporte, e o progresso é acompanhado. Após a resolução, são registradas as informações de fechamento e o sistema gera relatórios para a empresa. Em resumo, o sistema garante suporte eficiente, resolução de problemas e satisfação do cliente após a venda.
</p>

<h4> 1.1 - Objetivo do Software </h4>

<p>
   O objetivo do Gerenciamento de Peças e Pedidos - GPP é fornecer um suporte eficiente e de qualidade aos clientes após a venda de um produto ou serviço. Ele busca garantir a resolução rápida e eficaz de problemas técnicos, promovendo a satisfação do cliente e fortalecendo a reputação da empresa. O software visa facilitar o gerenciamento dos casos de assistência, desde o registro inicial até o fechamento do chamado, proporcionando uma experiência positiva e um atendimento personalizado aos clientes.
</p>
<div align="center">
    <img src="utilitarios/telas.png" alt="telas" />
</div>

<h4> 1.2 - Escopo do Projeto e Requisitos de Software </h4>
<p>O projeto envolve o desenvolvimento de um sistema de assistência técnica terceirizada para fornecer suporte aos clientes após a venda de produtos ou serviços. 

O escopo inclui as seguintes funcionalidades:

<li> 1 - Registro de casos: O sistema permitirá o registro de novos casos de assistência técnica, incluindo informações do cliente, detalhes do produto, número de série e garantia.
<li> 2 - Acompanhamento de casos: O sistema permitirá o acompanhamento do progresso dos casos de assistência técnica, registrando interações entre o cliente e o técnico, atualizações de status e soluções propostas.
<li> 3 - Comunicação com clientes: O sistema facilitará a comunicação entre os técnicos e os clientes, permitindo o envio de mensagens, agendamento de visitas técnicas e obtenção de informações adicionais sobre os problemas enfrentados.
<li> 4 - Registro de soluções: O sistema registrará as soluções adotadas para resolver os problemas dos clientes, incluindo peças substituídas, procedimentos realizados e qualquer outra ação tomada.
<li> 5 - Fechamento de casos: O sistema permitirá o registro das informações de fechamento dos casos, incluindo a descrição da solução adotada e o feedback do cliente.
</p>
<br>
<p> Fundamentado nas necessidades levantadas com o cliente, foram identificados os seguintes requisitos funcionais :
<br>
<br>
<div align="center">
<table>
    <thead>
    <tr>
        <th>ID</>
        <th> Nome </th>
        <th>DESCRIÇÃO</>
    </tr>
    </thead>
    <tbody>
        <tr>
            <td><b>RF01</b></td>
            <td><b>Casos</b></td>
            <td>O sistema deve permitir o registro de novos casos de assistência técnica, incluindo informações do cliente, detalhes do produto, número de série e garantia.</td>
        </tr>
        <tr>
            <td><b>RF02</b></td>
            <td><b>Progresso</b></td>
            <td>O sistema deve permitir o acompanhamento do progresso dos casos de assistência técnica, registrando interações entre o cliente e o técnico, atualizações de status e soluções propostas.</td>
        </tr>
        <tr>
            <td><b>RF03</b></td>
            <td><b>Técnicos</b></td>
            <td>O sistema deve permitir a designação de técnicos qualificados para lidar com os casos de assistência técnica, levando em consideração a disponibilidade e as habilidades necessárias.</td>
        </tr>
        <tr>
            <td><b>RF04</b></td>
            <td><b>Soluções</b></td>
            <td>O sistema deve registrar as soluções adotadas para resolver os problemas dos clientes, incluindo peças substituídas, procedimentos realizados e outras ações tomadas.</td>
        </tr>
     
</table>
</div>
<br>
<h4> 1.4 - Modelo de Domínio </h2>
<p>O modelo de domínio do GPP - Gerenciamento de Peças e Pedidos foi cuidadosamente desenvolvido para oferecer uma representação clara e estruturada dos principais elementos do processo de suporte e atendimento ao cliente. Esse modelo nos permite compreender e visualizar a forma como cada parte se relaciona e interage, o que resulta em uma gestão eficaz dos casos de assistência técnica.</p>
<div align="center">
    <img src="utilitarios/Modelo Dominio.png" alt="Texto alternativo" />
</div>
<br>
<h3> 2 - Arquitetura do Software </h2>
<p> A arquitetura de software de uma aplicação é o conjunto de decisões de design que definem como os diferentes componentes do sistema se relacionam e interagem entre si. Ela é responsável por garantir que a aplicação seja escalável, segura e capaz de lidar com as demandas dos usuários de forma eficiente. A documentação técnica da arquitetura de software é uma parte fundamental do processo de desenvolvimento, pois ajuda a equipe a entender como o sistema funciona e como cada componente se relaciona com os demais. Neste documento, serão descritos os principais componentes da arquitetura da aplicação, como eles se comunicam e quais são as suas responsabilidades. Além disso, serão apresentadas as principais tecnologias utilizadas na implementação da arquitetura, assim como as decisões de design que levaram à escolha dessas tecnologias.</p>

<div align="center">
    <img src="imagens/arquitetura-software.png" alt="Texto alternativo" />
</div>
