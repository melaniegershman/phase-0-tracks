# Release 0: View HTTP Requests

### What are some common HTTP status codes?
---
*Error codes:*
Error codes begin with a 4 or a 5. Error codes beginning with a 4 are client-side errors, and error codes beginning with a 5 are server-side errors. 

* 500 - A catchall error code.

* 503 - A temporary service error in which the web server is not available. Might be because the web server is overloaded.

* 504 - A gateway timeout. Possibly fixed by retrying the request.

* 404 - Not found, meaning the requested resource is not found or no longer available. Caused by typos, or more commonly, the aging of the internet in which a resource may have been removed.

* 403 - Access to the resource is forbidden.

*Redirect Codes:*
Redirect codes start with a 3.

* 300 - The requested resource has multiple choices and can't be resolved into one.

* 301 - The requested resource has been assigned a new URI.

* 302 - The requested resource has temporarily been assigned a different URI.

*Successful Response Codes:*

* 200 - The request was successful!

### What is the difference between a GET request and a POST request? When might each be used?
---
**Get** 
- parameters are included in the URL 
- used for fetching documents
- have a maximum URL length
- ok to cache, when you make a get request, there's a good chance that the request has been cached so you don't have to make a new request
- shouldn't change the server-- you can make the same request over and over and nothing changes
- get parameters describe what kind of page you are looking for

**Post**
- parameters are in the body
- used for updating data (actually making changes to the data held on the server)
- no maximum URL length
- not ok to cache
- ok to change the server with a post request-- that's what they're used for and why they're not cached
- post requests are destructive in nature
### Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
---
Each cookie is a small plaintext file stored by a browser on a user's machine, containing pairs of (key, data) values. Once the cookie has been read by the code on the server or client computer, the data can be retrieved and used to customise the web page appropriately. A cookie relates to HTTP requests in that, when you use a get request that is cached, it could use the cookie to customise the webpage appropriately to a user. Cookies are passed as HTTP headers, both in the request and in the response. 