# Exercise 02

## Broken BGP IPv4 Topology

![02_bgp_fix](02_bgp_fix.png)

This container topology consists of 4 routers with a single host connected behind each router and 3 different Autonomous Systems (AS65000, AS65100, AS65200)

Each AS has a /24 IPv4 Netblock assigned to itself.

The AS in the middle (AS65100) consists of 2 routers and on each router there is a connection to another AS.

Your goal is to get fix the network, so each host (h1, h2, h3, h4) can reach each other host.

At the beginning of the setup, the connectivity looks like this:

``` bash
$ ./test.sh 
Ping from each Host to each other host

IPv4:
    h1     h2     h3     h4     
h1  ----    ok    FAIL   FAIL 
h2   ok    ----    ok    FAIL 
h3  FAIL    ok    ----    ok  
h4  FAIL   FAIL    ok    ---- 
```

Your goal is to get this all working. The `test.sh` script will allow you to verify the solution

### Rules:

- You are NOT allowed to add additional connections
- You are NOT allowed to run OSPF or any other routing protocol except BGP between different AS. (OSPF inside an AS is allowed)
- You are NOT allowed to fix this with adding static routes pointing at hosts in different AS



Try to solve this first on your own without looking for help on a search engine or help from an AI. If you can't get it working, then use search engines/chatgpt/etc to try to get it working.

But DO NOT discuss with your colleague. Solve it on your own.

Fork this repository to your own github account and push a commit with the result to your github, then report back with the git location of the solution.