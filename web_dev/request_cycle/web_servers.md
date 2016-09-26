# Release 1: Research Web Servers

### What are some of the key design philosophies of the Linux operating system?
---
Key design philosophies of the Linux OS include: 

* use programs that do only one task, well (Linux is built out of small, replaceable components)
* link several programs together to accomplish complex taasks
* store information in plain text files whenever possible
* there are many ways to do anything
* use command line over GUI

### In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?
---
A VPS is a virtual computer that has its own OS, and that can be purchased from a hosting service. A VPS is less expensive than dedicated hosting services, and it provides root-level access so that you can install and delete software. You can also host multiple servers so that you can test your site on one without affecting it on another. 

### Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?
---
It's bad to run programs as the root user on a Linux system for security reasons. The root user is like a superuser who has access to everything. Operating as the root user means that all of your actions would need to be performed with `sudo`, which could be harmful if you make any typos or don't really know what you're doing. Additionally, it is harder to hack a server if you don't know the admin credentials.
