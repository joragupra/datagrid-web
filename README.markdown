Editable jQuery datagrid component
==================================

Description
-----------

A fully editable datagrid component that lets you introduce large data sets with ease. How? Just create a new record in your table and start filling fields. You can navigate from one field to the next on just clicking Tab key. When you reach the last field of a row a new one is created automatically. And it also gives you shortcuts to create new records or send your data bulk to the server. Start inserting your data in a fast way with no need to use your mouse!

What do you get?
----------------

A JavaScript library that empowers [DataTable](http://datatables.net/) to add some cool funcionalities like cell editing (based on [jEditable](http://www.appelsiini.net/projects/jeditable)), tab-press navigation through cells and shortcuts for most common actions (based on [Mousetrap](http://craig.is/killing/mice)). You'll have to include our datagrid library as well as some other supporting libreries in order to get your datagrid component up and running.

As an extra, you will find a working Java web app that uses datagrid and handles data on the server side. In this app we provide an abstract Servlet that receives data in JSON format and parses it with [Gson](https://sites.google.com/site/gson/). Then it delegates all the processing stuff to an abstract method you can extend. It's also provided a real subclass to show you how you could implement your own solution for data processing.

How to use it
-------------