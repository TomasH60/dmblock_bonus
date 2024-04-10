# dmblock_bonus <br />

## 1. Find a use case when blockchain is not suitable for the problem: <br />
One use case, where a blockchain network is not a good idea, could be in database systems, <br />
that require low latency. The main problem is that its not easy to provide such low latency data manipulation <br />
with a blockchain system, that a centralized database system provides. <br />
<br />

## 2. Come up with a simple problem where blockchain is suitable: <br />
A simple use case for a problem, where a blockchain is suitable, is a business store management system. <br />
The blockchain would be private, storing data about the current storage state of a business, <br />
what kind of supplies the business stores and how much of them it stores. <br />
<br />
### Addressing the key points to why we should use a blockchain solution for this system: <br />
* Do you need to store state?: Yes, for our problem storing the state of our inventory is key. <br />
* Are there multiple writers?: Yes, multiple employees can change and lookup the state of the storage at one time. <br />
* Can you use an always online TPP?: Yes we could use an always online TPP, but for smaller and simpler use cases, it would be <br />
wasteful. So in our case we dont have to use an always online TPP.
* Are all writers known?: Yes, we can set a defined array of writers that can lookup and modify the state of our contract. <br />
* Are all writers trusted?: If we want to keep things private, and only allow trusted writers to manipulate the state, we need to assume, <br />
that not every address that interacts with our contract is trusted. <br />
* Is public verifiability required?: No, the state of our storage is private. <br />


