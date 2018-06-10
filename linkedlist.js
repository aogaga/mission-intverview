class LinkedList {
	
	constructor() {
		this.head = null;
	}
	
	traverse(fn) {
		let current = this.head;
		let last = null;
		while(current){
			const result = fn(current, last);
			last = current;
			current = current.next;
			if(result) break;
		}
		return last;
	}
	
	insertAt(node, val){
		const newNode = {
			value: val,
			next: node.next
		}
		node.next = newNode;
		return newNode;
	}

	append(val){
		const newNode = {
			value : vale,
			next: null
		}

		if(!this.head){
			this.head = newNode
		}else{
			const lastNode = this.traverse(n => false);
			lastNode.next = newNode;
		}
		return newNode;
	}

	remove(node){
		if(this.head.value === node.value){
			this.head = this.head.next
		}else{
			this.traverse((n, last) => {
				if(n.value === node.value){
					last.next = n.next;
				}
			});
		}
	}


}



const list = new LinkedList();
const print = ()=> list.traverse(n=> console.log(n.value));
list.append(1);
const two = list.append(2);
list.append(3);
print();
console.log("Inserting 5 .....");
list.insertAt(two, 5);
print();
console.log("Removing 2");
list.remove(two)
print();