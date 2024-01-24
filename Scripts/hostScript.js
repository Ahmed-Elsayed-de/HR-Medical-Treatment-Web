function getHostName() {
//       alert(window.location.hostname);
    //    alert('Hi');
    var net = new ActiveXObject("WScript.Network");
    alert(net.ComputerName);
}