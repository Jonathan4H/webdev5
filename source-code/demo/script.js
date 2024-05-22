const products = [
  {
    image: 'card-img.jpg',
    title: 'Kursus Pemrograman Python',
    instructor: 'John Doe',
    price: 500000,
    duration: '6 minggu',
    level: 'Pemula',
    description: 'Pelajari pemrograman Python dari awal dengan proyek-proyek praktis.'
  },
  {
    image: 'card-img.jpg',
    title: 'Bootcamp Pengembangan Web JavaScript',
    instructor: 'Jane Smith',
    price: 800000,
    duration: '8 minggu',
    level: 'Menengah',
    description: 'Kuasai JavaScript dan bangun aplikasi web dinamis.'
  },
  {
    image: 'card-img.jpg',
    title: 'Fundamental Pemrograman Java',
    instructor: 'David Johnson',
    price: 700000,
    duration: '7 minggu',
    level: 'Menengah',
    description: 'Mulai belajar pemrograman Java dan bangun fondasi Anda.'
  },
  {
    image: 'card-img.jpg',
    title: 'Pemrograman C# untuk Pemula',
    instructor: 'Emily Wilson',
    price: 450000,
    duration: '5 minggu',
    level: 'Pemula',
    description: 'Pengantar ke bahasa pemrograman C# untuk pemula.'
  },
  {
    image: 'card-img.jpg',
    title: 'Dasar HTML dan CSS',
    instructor: 'Michael Brown',
    price: 300000,
    duration: '4 minggu',
    level: 'Pemula',
    description: 'Pelajari dasar-dasar HTML dan CSS untuk pengembangan web.'
  },
  {
    image: 'card-img.jpg',
    title: 'Struktur Data dan Algoritma dengan Python',
    instructor: 'Sarah Clark',
    price: 600000,
    duration: '9 minggu',
    level: 'Menengah',
    description: 'Kuasai struktur data dan algoritma menggunakan Python.'
  },
  {
    image: 'card-img.jpg',
    title: 'Pengembangan Frontend React.js',
    instructor: 'Matthew Taylor',
    price: 900000,
    duration: '10 minggu',
    level: 'Lanjutan',
    description: 'Kursus lanjutan untuk membangun aplikasi web modern dengan React.js.'
  },
];

function calculateDiscountedPrice(price) {
  const discountThreshold = 500000; // IDR
  const discountRate = 0.1; // 10%
  if (price > discountThreshold) {
    return price - (price * discountRate);
  }
  return price;
}

// Function to render product cards
function renderProductCards() {
  const productListDiv = document.getElementById('product-list');
  // Clear any existing content in the product list
  productListDiv.innerHTML = '';
  // Iterate over the products and create HTML elements for each product
  products.forEach(product => {
    // Calculate discounted price if applicable
    const discountedPrice = calculateDiscountedPrice(product.price);

    const productCard = `
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <img src="${product.image}" alt="Course image" class="card-img-top h-32">
          <div class="card-body">
            <h1 class="card-title pricing-card-title">${product.title}</h1>
            <p class="fw-bold">Instruktur: ${product.instructor}</p>
            <p class="lead">Harga: ${discountedPrice !== product.price ? `<s>Rp ${product.price.toLocaleString()}</s> Rp ${discountedPrice.toLocaleString()}` : `Rp ${product.price.toLocaleString()}`}</p>
            <p>Durasi: ${product.duration}</p>
            <p>Level: ${product.level}</p>
            <p>${product.description}</p>
            <a href="edspert.html" class="w-100 btn btn-lg btn-brand">Daftar Sekarang</a>
          </div>
        </div>
      </div>
    `;
    // Append the product card HTML to the product list div
    productListDiv.innerHTML += productCard;
  });
}

// Call the function to render product cards when the page loads
window.onload = renderProductCards;