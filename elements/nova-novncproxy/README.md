Install nova-novncproxy along with the necessary components from noVNC.

Configuration (via the nova element)
-------------

When using VNC be sure to set nova.public_ip (providated via the nova element).
This is used to specify the novncproxy_base_url for external proxy connections
and is typically configured on controller nodes.
