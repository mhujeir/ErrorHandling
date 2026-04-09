Item.destroy_all

Item.create!(
  [
    { name: "Laptop", description: "14-inch business laptop", price: 899.99 },
    { name: "Keyboard", description: "Mechanical keyboard", price: 119.50 },
    { name: "Mouse", description: "Wireless mouse", price: 39.99 },
    { name: "Monitor", description: "27-inch display", price: 249.99 }
  ]
)