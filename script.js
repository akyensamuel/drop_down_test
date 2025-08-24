const db = [
    { id: 1, name: "Item 1", price: 10 },
    { id: 2, name: "Item 2", price: 20 },
    { id: 3, name: "Item 3", price: 30 }
];

document.addEventListener("alpine:init", () => {
    
    // create an alpine component

    Alpine.data("dropdown", () => ({
        db: db,
        filtered: [], 
        open: false,
        toggle() {
            this.open = !this.open;
        },
        filter(query){
            // this.db = this.db.filter(item => item.name.toLowerCase().includes(query.toLowerCase()));
        }

    }));

});