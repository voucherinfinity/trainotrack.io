// Define the entries
const entries = [
    {
        name: "Shrichand Computer",
        phones: ["+919999402408", "+919999402408"]
    },
    {
        name: "Qureshi Drit",
        phones: ["+919414000227", "+919414000227"]
    },
    {
        name: "Tech Campus Chandigarh",
        phones: ["+919814666333", "+919814666333"]
    }
];

// Function to generate serial numbers
function generateSerialNumbers(entries) {
    return entries.map((entry, index) => {
        return {
            serialNumber: index + 1,
            name: entry.name,
            phones: entry.phones
        };
    });
}

// Call the function and get the serial numbers
const entriesWithSerialNumbers = generateSerialNumbers(entries);

// Output the entries with serial numbers
console.log(entriesWithSerialNumbers);