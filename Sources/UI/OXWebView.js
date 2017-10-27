(function() {
 function OXWebView(messageHandler) {
 this.messageHandler = messageHandler
 }
 
 OXWebView.prototype = {
 pageLoaded: function() {
 this.postMessageAfterNextRepaint("pageLoaded", {
                                  
                                  })
 },
 
 errorRaised: function(error) {
 this.postMessage("errorRaised", {
                  error: error
                  })
 },
 
 postMessage: function(name, data) {
 this.messageHandler.postMessage({
                                 name: name,
                                 data: data || {}
                                 })
 },
 
 postMessageAfterNextRepaint: function(name, data) {
 if (document.hidden) {
 this.postMessage(name, data);
 } else {
 var postMessage = this.postMessage.bind(this, name, data)
 requestAnimationFrame(function() {
                       requestAnimationFrame(postMessage)
                       })
 }
 }
 }
 
 this.webView = new OXWebView(webkit.messageHandlers.oxwebviewhandler)
 
 addEventListener("error", function(event) {
                  var error = event.message + " (" + event.filename + ":" + event.lineno + ":" + event.colno + ")"
                  webView.errorRaised(error)
                  }, false)
 
 webView.pageLoaded()
 })()
