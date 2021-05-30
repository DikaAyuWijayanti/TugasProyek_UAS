-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Bulan Mei 2021 pada 05.38
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_shoponline`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Sayur biji - bijian', 'sayur biji - bijian', '2019-03-02 17:06:05', '2019-03-02 17:06:05'),
(2, 'sayur daun', 'sayur daun', '2019-03-02 17:06:11', '2019-03-02 17:06:11'),
(3, 'Sayur bunga', 'sayur bunga', '2019-03-02 17:06:16', '2019-03-02 17:06:16'),
(4, 'Sayur buah', 'Sayur buah', '2019-03-02 17:06:29', '2019-03-02 17:06:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `confirms`
--

CREATE TABLE `confirms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_order` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_12_21_181025_create_products_table', 1),
(4, '2018_12_21_181226_create_categories_table', 1),
(5, '2018_12_21_181849_add_fiel_category_id_to_product_table', 1),
(6, '2018_12_21_182345_create_orders_table', 1),
(7, '2018_12_21_183130_create_order__product_controllers_table', 1),
(8, '2018_12_22_115009_add_field_role_to_users_table', 1),
(9, '2018_12_22_200035_add_field_subtotal_to_order_product_table', 1),
(10, '2018_12_23_114605_create_confirms_table', 1),
(11, '2018_12_23_174258_add_field_status_order_to_confirms_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `receiver` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('belum bayar','menunggu verifikasi','dibayar','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `receiver`, `address`, `total_price`, `date`, `status`, `created_at`, `updated_at`) VALUES
(5, 5, 'Sofia', 'jalan mawar Gg.Turki No.12  Blok 2', 2500, '2021-05-19', 'belum bayar', '2021-05-19 09:09:24', '2021-05-19 09:09:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_product`
--

CREATE TABLE `order_product` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `qty`, `created_at`, `updated_at`, `subtotal`) VALUES
(8, 5, 9, 1, '2021-05-19 09:09:25', '2021-05-19 09:09:25', '2500.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin1@gmail.com', '$2y$10$vP2IzinD8oCTi2FHWA3gie/B1Nvgn7Kbx/3fWQRVN2AxQfUrfO03.', '2021-05-19 09:21:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('publish','draft') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock`, `image`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Brokoli', 'brokoli adalah sayur dengan kepala bunga berwarna hijau yang tersusun rapat seperti cabang pohon dengan batang tebal. Sebagian besar kepala bunga tersebut dikelilingi dedaunan. Brokoli paling mirip dengan kembang kol, namun brokoli berwarna hijau, sedangkan kembang kol putih. ', 5000, 100, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/5/5/97b96e97-2886-443a-855d-2e02715f5197.jpg', 'publish', '2019-03-02 17:15:28', '2019-03-02 17:25:40', 3),
(3, 'Wortel', 'Wortel adalah jenis sayuran yang berwarna kuning kemerahan atau jingga kekuningan dengan tekstur yang mirip seperti kayu. Bagian yang dapat dimakan dari wortel adalah bagian umbi atau akarnya', 3000, 100, 'https://public.urbanasia.com/images/post/2020/08/07/1596795798-manfaat-wortel.jpg', 'publish', '2019-03-02 17:16:30', '2019-03-02 17:16:30', 4),
(4, 'Tomat', 'Tomat adalah sumber kuat antioksidan dan vitamin C yang membantu melawan radikal bebas melawan kanker. Kandungan lycopene yang tinggi pada tomat membantu mencegah kanker. Tomat mengandung kolin, potassium, serat dan vitamin C yang membantu meningkatkan fungsi jantung.', 2000, 100, 'https://img.okezone.com/content/2017/09/19/65/1778991/jempol-keterbatasan-lahan-mahasiswa-ciptakan-sistem-hidroponik-otomatis-untuk-tanam-tomat-cherry-veCchgxS6s.jpg', 'publish', '2019-03-02 17:17:54', '2019-03-02 17:17:54', 4),
(5, 'Sawi', 'Sawi hijau adalah salah satu sayuran daun populer di Indonesia. Nama lainnya adalah sawi bakso atau caisim/caisin. Jenis sawi lain yang juga kadang-kadang disebut sawi hijau adalah pakcoy/petsai atau sawi sendok.', 1500, 100, 'https://sayurmalang.com/wp-content/uploads/2020/08/sawi-pahit.jpg', 'publish', '2019-03-02 17:18:12', '2019-03-02 17:18:12', 2),
(6, 'Cabai Rawit', 'Cabai atau cabai merah atau lombok adalah buah dan tumbuhan anggota genus Capsicum. Buahnya dapat digolongkan sebagai sayuran maupun bumbu, tergantung bagaimana digunakan. Sebagai bumbu, buah cabai yang pedas sangat populer di Asia Tenggara sebagai penguat rasa makanan.', 15000, 100, 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//87/MTA-4017730/eden_farm_eden_farm_-_cabe_rawit_merah_-250_gr-_full02.jpg', 'publish', '2019-03-02 17:18:39', '2019-03-02 17:18:39', 4),
(7, 'Kacang Panjang', 'Kacang panjang adalah salah satu tanaman sayuran yang populer dalam kuliner Asia Tenggara dan Asia Timur. Buah polongnya dimasak sebagai sayur atau dimakan mentah sebagai lalapan. Ia tumbuh dengan cara memanjat atau melilit.', 1500, 100, 'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/10/3/17cc345c-3939-4287-9126-126645dc6814.jpg', 'publish', '2019-03-02 17:19:27', '2019-03-02 17:28:33', 1),
(8, 'Kacang Polong', 'Kacang polong adalah satu dari sekian banyak jenis kacang-kacangan dengan bentuk fisik bulat, berukuran kecil, dan berwarna hijau khas yang tampak segar.', 1800, 100, 'https://asset-a.grid.id/crop/0x0:0x0/360x240/photo/2020/01/20/171038320.jpg', 'publish', '2019-03-02 17:19:45', '2019-03-02 17:19:45', 1),
(9, 'Bayam', 'Bayam (Amaranthus) adalah tumbuhan yang biasa ditanam untuk dikonsumsi daunnya sebagai sayuran hijau. Tumbuhan ini berasal dari Amerika tropik namun sekarang tersebar ke seluruh dunia. Tumbuhan ini dikenal sebagai sayuran sumber zat besi yang penting bagi tubuh.', 2500, 100, 'https://portalmadura.com/wp-content/uploads/2020/01/sayur-bayam.jpg', 'publish', '2019-03-02 17:20:01', '2019-03-02 17:20:01', 2),
(10, 'Jagung', 'Jagung merupakan salah satu tanaman pangan dunia yang terpenting, selain gandum dan padi. Sebagai sumber karbohidrat utama di Amerika Tengah dan Selatan, jagung juga menjadi alternatif sumber pangan di Amerika Serikat.', 3000, 100, 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//111/MTA-8992776/sayur_home_delivery_sayurhhd_sayur_segar_jagung_manis_per_1_pcs_full01_db0d7omn.jpg', 'publish', '2019-03-02 17:20:52', '2019-03-02 17:20:52', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','customer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, 'admin123', 'admin123', '2019-03-02 17:04:23', '2019-03-02 17:04:23', 'admin'),
(2, 'customer', 'customer@gmail.com', NULL, 'customer123', 'customer123', '2019-03-02 17:32:28', '2019-03-02 17:32:28', 'customer'),
(4, 'admin1', 'admin1@gmail.com', NULL, '$2y$10$I4h.37gUC8WnBxu8ATrQjuwzpuuzNNK4AaRsWCSpxURzdcWt/6FjK', 'RhhrCkOSTj4O74V8L68Uh2ONPtikxjSWC9vLw6dcBbPJfkIp9gKczWDlhOJf', '2021-05-19 02:46:35', '2021-05-19 02:46:35', 'customer'),
(5, 'Sofia', 'sofia@gmail.com', NULL, 'sofia1', 'z2fY7vHi8fY1iFRz5KTNneRublVlr9I0tfnWvRf21BiAS0Rt9e9w5foUTmtA', '2021-05-19 08:50:15', '2021-05-19 08:50:15', 'customer'),
(6, 'admin2', 'admin2@gmail.com', NULL, '$2y$10$USoJaYOjOslA6kalsJ.bKeFDX7Iz8v9tq40cPrlpr7cn5IMikxx9K', 'SqzFJ1IRzeXox4qNyelCMWnqPxvoXXCMDk7l32LMhWqMXYp2ethLIeGZaOeB', '2021-05-19 09:24:46', '2021-05-19 09:24:46', 'customer'),
(8, 'Bagus puji', 'baguspuji@gmail.com', NULL, '$2y$10$ICh020KB1XI0k5VeqfjMbeuwFSlzyFdBOKdP9dz1Vm9yHY2fPIJa.', 'WUmw3Egah6xorWM31esbv8h1uWp4LtvskO0VdvWhZbCVKKG6uuwcOj4aOhsv', '2021-05-29 05:43:59', '2021-05-29 05:43:59', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `confirms`
--
ALTER TABLE `confirms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `confirms_user_id_foreign` (`user_id`),
  ADD KEY `confirms_order_id_foreign` (`order_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `confirms`
--
ALTER TABLE `confirms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `confirms`
--
ALTER TABLE `confirms`
  ADD CONSTRAINT `confirms_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `confirms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
