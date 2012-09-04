Editable jQuery datagrid component
==================================

Description
-----------

A fully editable datagrid component that lets you introduce large data sets with ease. How? Just create a new record in your table and start filling fields. You can navigate from one field to the next on just clicking Tab key. When you reach the last field of a row a new one is created automatically. And it also gives you shortcuts to create new records or send your data bulk to the server. Start inserting your data in a fast way with no need to use your mouse!

What do you get?
----------------

A JavaScript library that empowers [DataTable](http://datatables.net/) to add some cool funtionalities like cell editing (based on [jEditable](http://www.appelsiini.net/projects/jeditable)), tab-press navigation through cells and shortcuts for most common actions (based on [Mousetrap](http://craig.is/killing/mice)). You'll have to include our datagrid library as well as some other supporting libraries in order to get your datagrid component up and running.

As an extra, you will find a working Java web app that uses datagrid and handles data on the server side. In this app we provide an abstract Servlet that receives data in JSON format and parses it with [Gson](https://sites.google.com/site/gson/). Then it delegates all the processing stuff to an abstract method you can extend. It's also provided a real subclass to show you how you could implement your own solution for data processing.

How to use it
-------------

In order to get the editable jQuery datagrid component up and running in your project just follow these steps:

1. Add DatagridHandler and DatagridHandlerResponse to you source code. Or package it in a JAR file and add it to your classpath.
2. Provide a proper DatagridHandler subclass. Don't panic: it's very easy to extends DatagridHandler. You can see a working subclass that handles entities of type Factura in FacturasDataHandler.
3. Declare you DatagridHandler as a servlet in your web.xml file and provide an URL that links with that servlet like the following:
`    <servlet>
        <description>Editable and tab navigable DataTable Handler</description>
        <servlet-class>com.everis.interesesdemora.FacturasDataHandler</servlet-class>
        <servlet-name>DataTableHadler</servlet-name>
     </servlet>
     
     <servlet-mapping>
        <servlet-name>DataTableHadler</servlet-name>
        <url-pattern>/send.do</url-pattern>
     </servlet-mapping>`
4. Include the following web resources in your application:
* bootstrap.js
* jquery.dataTables.js
* jquery.editAndTabDataTables.js
* jquery.jeditable.js
* jquery.js
* mousetrap.min.js
* jquery.dataTables.css
* bootstrap.css
Inside this project you can find an example layout for a typical Java web application.
5. Make your table fully editable in an authentic datagrid way! You just need to reference all these resources in your HTML and call the JavaScript function `editAndTabDataTable` with the following parameters:
* Your table ID.
* The URL where your DatagridHandler is listening (the one you declared in your `server.xml` file).
6. Enjoy your new and easy way to input data in your web application.