# homelab
My home lab in Docker

Separated services which are used in my home lab.

You can use it as it is, however some passworsd in the config need to be changed.
The structure planned for a home environment, because services are not secure.

Nginx Proxy Manager does the security only from the outside.

Your router should allow two ports from outside/web (80,443) and Nginx Proxy Manager should do the translation for the inside services.
That is the way how to use https for the inside services.
