# Alfred-Keepass
Alfred-Keepass is a Alfred Workflow based on Ruby Script. 
[Download Here](https://github.com/samueldeng/alfred-keepass/releases/download/0.1/alfred-keepass.alfredworkflow)
![alt text](https://github.com/samueldeng/alfred-keepass/raw/master/screenshot/alfred_keepass_4.png)

# Features
 * **Pure:** No F**k Library Dependency.
 * **Simple:** Two Steps to Use.
 * **Hackable:** Only Three Ruby Scripts.
 * **Privacy:** Password by Yourself. 
 
# How to use
Install and Configure [MacPass](https://github.com/mstarke/MacPass) and [MacPassHTTP](https://github.com/MacPass/MacPassHTTP).

Generate `KeePassHTTP Settings` in the database.
![alt text](https://github.com/samueldeng/alfred-keepass/raw/master/screenshot/alfred_keepass_1.png)

Import the alfred workflow and double click to configure the `AES-KEY`.
![alt text](https://github.com/samueldeng/alfred-keepass/raw/master/screenshot/alfred_keepass_2.png)

Replace the `key_name` and `aes_key` accoring to `Figure 1`.
![alt text](https://github.com/samueldeng/alfred-keepass/raw/master/screenshot/alfred_keepass_3.png)

Using `kp` keyword to query, and `CMD+C` to copy the password into clipboard.
![alt text](https://github.com/samueldeng/alfred-keepass/raw/master/screenshot/alfred_keepass_4.png)

# Troubleshooting
* **DO NOT** close the MacPass, just minimize the window to keep the `KeePassHTTP Service` alive.

# Roadmap
* Eeception Handling.
* Copy Username & password both.

# Resources
[KeePassHTTP](https://github.com/pfn/keepasshttp) a Protocols and Plugin provided by the Keepass.

[KeepassHTTP：安全的API设计
](http://blog.shuolingdeng.com/2016/10/keepasshttpapi.html) a Analytical Paper of KeePassHTTP. 