using System;
using System.Collections.Generic;
using System.Linq;

namespace KhedutPlus.Models
{
    public class Crop
    {
        public Crop()
        {
            Varieties = new List<CropVariety>();
            PestDiseases = new List<CropPestDisease>();
        }

        public string Id { get; set; }
        public string Name { get; set; }
        public string LocalName { get; set; }
        public string ScientificName { get; set; }
        public string Category { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public string Season { get; set; }
        public string Water { get; set; }
        public string Soil { get; set; }
        public string Duration { get; set; }
        public string AvgYield { get; set; }
        public string MarketRate { get; set; }
        public string Climate { get; set; }
        public string SowingSeason { get; set; }
        public string WaterManagement { get; set; }
        public string SoilRequirement { get; set; }
        public string HarvestTiming { get; set; }
        public string HarvestMethod { get; set; }
        public string SafeStorage { get; set; }
        public List<CropVariety> Varieties { get; set; }
        public List<CropPestDisease> PestDiseases { get; set; }
    }

    public class CropVariety
    {
        public string Name { get; set; }
        public string Yield { get; set; }
        public string Notes { get; set; }
    }

    public class CropPestDisease
    {
        public string Name { get; set; }
        public string Kind { get; set; } // Disease / Pest
        public string Subtitle { get; set; }
        public string Treatment { get; set; }
    }

    public class DiseaseSolution
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string AffectsCrop { get; set; }
        public string Category { get; set; } // FUNGAL, VIRAL, BACTERIAL
        public string Symptom { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public string Treatment { get; set; }
        public string Prevention { get; set; }
        public string Severity { get; set; }
        public string RecommendedProducts { get; set; }
    }

    public class Fertilizer
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Sku { get; set; }
        public string Category { get; set; } // Nitrogenous, Complex, Potassic, Organic/Bio
        public string Description { get; set; }
        public string KeyFeature1 { get; set; }
        public string KeyFeature2 { get; set; }
        public string ImageUrl { get; set; }
        public string NpkRatio { get; set; }
        public int StockCurrent { get; set; }
        public int StockMax { get; set; }
        public decimal Price { get; set; }
        public string Status { get; set; }
        public string ApplicationMethod { get; set; }
        public string RecommendedDosage { get; set; }
        public string SuitableCrops { get; set; }
        public string SafetyTips { get; set; }
    }

    public class Pesticide
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Sku { get; set; }
        public string Category { get; set; } // Insecticide, Fungicide, Bio-pesticide, Herbicide
        public string ToxicityLevel { get; set; } // Highly Toxic, Safe/Organic, Moderate Toxicity
        public string Description { get; set; }
        public string Targets { get; set; }
        public string Dosage { get; set; }
        public string ImageUrl { get; set; }
        public string ExpiryDate { get; set; }
        public string StockLevel { get; set; }
        public string Status { get; set; }
        public string SafetyPrecautions { get; set; }
        public string ApplicationMethod { get; set; }
        public string AntidoteFirstAid { get; set; }
        public string SuitableCrops { get; set; }
    }

    public class Scheme
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Ministry { get; set; }
        public string Category { get; set; } // Direct Benefit, Government Subsidy, State Level Subsidy, Infrastructure Aid, Fertilizer Subsidy, Horticulture Focus
        public string BenefitBadge { get; set; }
        public string Description { get; set; }
        public string Deadline { get; set; }
        public string Status { get; set; } // APPLY NOW, ENROLLED, Active
        public string ActiveApps { get; set; }
        public string FundsAllocated { get; set; }
        public string Icon { get; set; }
        // New detail fields
        public string Eligibility { get; set; }          // Who can apply
        public string RequiredDocuments { get; set; }    // Comma-separated list of documents
        public string HowToApply { get; set; }           // Short steps to apply
        public string PortalUrl { get; set; }            // Direct govt portal link
        public string PortalName { get; set; }           // Portal display name
    }

    public class SavedItem
    {
        public string Id { get; set; }
        public string Title { get; set; }
        public string Badge { get; set; }
        public string Category { get; set; } // Articles, Guides, Disease Info
        public string Description { get; set; }
        public string SavedAgo { get; set; }
        public string ImageUrl { get; set; }
    }

    public class AgroStore
    {
        public AgroStore()
        {
            Tags = new List<string>();
            Services = new List<string>();
        }

        public string Id { get; set; }
        public string Name { get; set; }
        public double Rating { get; set; }
        public int ReviewsCount { get; set; }
        public string Address { get; set; }
        public string District { get; set; }
        public string Phone { get; set; }
        public string Timings { get; set; }
        public List<string> Tags { get; set; }
        public List<string> Services { get; set; }
        public string ImageUrl { get; set; }
        public string BannerUrl { get; set; }
        public bool Verified { get; set; }
    }

    public class NotificationItem
    {
        public string Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string TimeAgo { get; set; }
        public string Category { get; set; } // Crops, Schemes, Disease Alerts
        public string IconClass { get; set; }
        public string ActionText { get; set; }
        public string ActionUrl { get; set; }
    }

    public class ShopOrderItem
    {
        public string OrderId { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAvatar { get; set; }
        public string CustomerPhone { get; set; }
        public string CustomerEmail { get; set; }
        public string DeliveryAddress { get; set; }
        public string DateFormatted { get; set; }
        public string TimeFormatted { get; set; }
        public string ItemsCount { get; set; }
        public decimal TotalAmount { get; set; }
        public string PaymentStatus { get; set; }
        public string OrderStatus { get; set; }
        public string Notes { get; set; }
    }

    public class ShopProduct
    {
        public string Sku { get; set; }
        public string Name { get; set; }
        public string Category { get; set; }
        public string Type { get; set; }
        public string NpkRatio { get; set; }
        public string TargetPest { get; set; }
        public string ToxicityLevel { get; set; }
        public string ExpiryDate { get; set; }
        public string StockLevel { get; set; }
        public int StockCurrent { get; set; }
        public int StockMax { get; set; }
        public decimal Price { get; set; }
        public decimal CostPrice { get; set; }
        public string Status { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public string StoreId { get; set; }  // Which AgroStore stocks this product
    }

    public class StockUpdateRecord
    {
        public string DateTimeFormatted { get; set; }
        public string ProductName { get; set; }
        public string Sku { get; set; }
        public string UpdateType { get; set; } // RESTOCK, SALE, ADJUSTMENT, DAMAGE
        public int QtyChange { get; set; }
        public int NewStock { get; set; }
        public string UpdatedBy { get; set; }
        public string UpdatedByAvatar { get; set; }
        public string ProductImage { get; set; }
    }

    public class ShopCustomer
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string AvatarUrl { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string LastOrderDate { get; set; }
        public decimal TotalSpent { get; set; }
        public string Status { get; set; } // Active, Inactive
        public string Location { get; set; }
        public string Address { get; set; }
        public string LandSize { get; set; }
    }

    public class AdminFarmer
    {
        public string Name { get; set; }
        public string AvatarUrl { get; set; }
        public string Location { get; set; }
        public string ContactNumber { get; set; }
        public string RegisteredDate { get; set; }
        public string Status { get; set; } // Active, Blocked
    }

    public class AdminShop
    {
        public string Name { get; set; }
        public string AvatarUrl { get; set; }
        public string Owner { get; set; }
        public string Location { get; set; }
        public string Verification { get; set; } // Verified, Pending
    }

    public class AdminActivity
    {
        public string Title { get; set; }
        public string TimeAgo { get; set; }
        public string AvatarUrl { get; set; }
        public string Type { get; set; }
    }

    public class AdminUserItem
    {
        public string Name { get; set; }
        public string Email { get; set; }
        public string AvatarUrl { get; set; }
        public string Initials { get; set; }
        public string Role { get; set; }
        public string Region { get; set; }
        public string LastLogin { get; set; }
        public string Status { get; set; }
    }

    public static class DataStore
    {
        public static List<Crop> Crops { get; set; }
        public static List<DiseaseSolution> Diseases { get; set; }
        public static List<Fertilizer> Fertilizers { get; set; }
        public static List<Pesticide> Pesticides { get; set; }
        public static List<Scheme> Schemes { get; set; }
        public static List<SavedItem> SavedItems { get; set; }
        public static List<AgroStore> Stores { get; set; }
        public static List<NotificationItem> Notifications { get; set; }
        public static List<ShopOrderItem> ShopOrders { get; set; }
        public static List<NotificationItem> ShopNotifications { get; set; }
        public static List<ShopProduct> ShopProducts { get; set; }
        public static List<StockUpdateRecord> StockUpdates { get; set; }
        public static List<ShopCustomer> Customers { get; set; }
        public static List<AdminFarmer> AdminFarmers { get; set; }
        public static List<AdminShop> AdminShops { get; set; }
        public static List<AdminActivity> AdminActivities { get; set; }
        public static List<AdminUserItem> AdminUsers { get; set; }

        static DataStore()
        {
            Crops = new List<Crop>();
            Diseases = new List<DiseaseSolution>();
            Fertilizers = new List<Fertilizer>();
            Pesticides = new List<Pesticide>();
            Schemes = new List<Scheme>();
            SavedItems = new List<SavedItem>();
            Stores = new List<AgroStore>();
            Notifications = new List<NotificationItem>();
            ShopOrders = new List<ShopOrderItem>();
            ShopNotifications = new List<NotificationItem>();
            ShopProducts = new List<ShopProduct>();
            StockUpdates = new List<StockUpdateRecord>();
            Customers = new List<ShopCustomer>();
            AdminFarmers = new List<AdminFarmer>();
            AdminShops = new List<AdminShop>();
            AdminActivities = new List<AdminActivity>();
            AdminUsers = new List<AdminUserItem>();

            InitializeData();
        }

        private static void InitializeData()
        {
            // Crops (Matches PDF 1 Page 4 & 5)
            var wheat = new Crop
            {
                Id = "wheat",
                Name = "Wheat",
                LocalName = "Gehu",
                ScientificName = "Triticum aestivum",
                Category = "Grains",
                ImageUrl = "/Images/crops/wheat.jpg",
                Description = "A primary staple grain essential for nutrition and economy. In India, it is a primary staple grain and a key contributor to the national economy. Known locally as 'Gehu', it is mainly grown as a Rabi (winter) crop.",
                Season = "Winter (Rabi)",
                Water = "Moderate (3-5 waterings)",
                Soil = "Loamy and well-drained",
                Duration = "110-150 Days",
                AvgYield = "3.5 - 5.5 t/ha",
                MarketRate = "₹2,125 / Qtl",
                Climate = "Cool & Moist",
                SowingSeason = "November to December (Rabi season). Early sowing helps in better grain development before the onset of hot summer winds.",
                WaterManagement = "Wheat requires 4-6 irrigations at critical stages: Crown Root Initiation (CRI), tillering, flowering, and grain filling.",
                SoilRequirement = "Loamy and well-drained soil with a pH of 6.0-7.5 is ideal. Deep alluvial soils with high water-holding capacity perform best.",
                HarvestTiming = "Harvest when the moisture content drops to 12-14%. The grains should be hard and leaves completely dry/golden.",
                HarvestMethod = "Mechanical harvesting using combine harvesters is preferred for large fields. Hand harvesting uses sickles.",
                SafeStorage = "Store in moisture-proof containers or metal bins. Use Aluminum Phosphide for fumigation against storage pests."
            };
            wheat.Varieties.Add(new CropVariety { Name = "HD 2967", Yield = "5.0 t/ha", Notes = "Popular in NW India, high rust resistance." });
            wheat.Varieties.Add(new CropVariety { Name = "DBW 187 (Karan Vandana)", Yield = "6.5 t/ha", Notes = "Rich in iron and protein, heat tolerant." });
            wheat.Varieties.Add(new CropVariety { Name = "PBW 343", Yield = "4.8 t/ha", Notes = "Classic variety for Punjab/Haryana regions." });
            wheat.PestDiseases.Add(new CropPestDisease { Name = "Yellow Rust", Kind = "Disease", Subtitle = "Appear as small, yellowish stripes on leaves.", Treatment = "Treat with Propiconazole (Tilt) @ 0.1% or Mancozeb." });
            wheat.PestDiseases.Add(new CropPestDisease { Name = "Aphids", Kind = "Pest", Subtitle = "Small green insects sucking sap from spikes.", Treatment = "Apply Imidacloprid or spray diluted Neem oil during early stages." });
            wheat.PestDiseases.Add(new CropPestDisease { Name = "Karnal Bunt", Kind = "Disease", Subtitle = "Fungal disease affecting grain quality.", Treatment = "Use certified seeds and practice crop rotation with non-host crops." });
            Crops.Add(wheat);

            Crops.Add(new Crop
            {
                Id = "tomato",
                Name = "Tomato",
                Category = "Vegetables",
                ImageUrl = "/Images/crops/tomato.jpg",
                Description = "Versatile vegetable used in various cuisines worldwide.",
                Season = "Year-round (Kharif/Rabi)",
                Water = "High (Daily in summer)",
                Soil = "Rich, organic-heavy soil"
            });

            Crops.Add(new Crop
            {
                Id = "mango",
                Name = "Mango",
                LocalName = "Kesar",
                Category = "Fruits",
                ImageUrl = "/Images/crops/mango.jpg",
                Description = "The king of fruits, popular for its sweet and aromatic pulp.",
                Season = "Summer",
                Water = "Low (Once established)",
                Soil = "Deep alluvial or laterite"
            });

            Crops.Add(new Crop
            {
                Id = "cotton",
                Name = "Cotton",
                LocalName = "Kapas",
                Category = "Commercial",
                ImageUrl = "/Images/crops/cotton.jpg",
                Description = "Major fiber crop used extensively in the textile industry.",
                Season = "Rainy (Kharif)",
                Water = "High (During flowering)",
                Soil = "Black cotton soil (Regur)"
            });

            Crops.Add(new Crop
            {
                Id = "green-chili",
                Name = "Green Chili",
                LocalName = "Marcha",

                Category = "Spices",
                ImageUrl = "/Images/crops/chili.jpg",
                Description = "Adds spice and flavor to food; rich in Vitamin C.",
                Season = "Warm (Year-round)",
                Water = "Regular, avoid logging",
                Soil = "Sandy loam to clayey"
            });

            Crops.Add(new Crop
            {
                Id = "rice",
                Name = "Rice",
                LocalName = "Chokha",
                Category = "Grains",
                ImageUrl = "/Images/crops/rice.jpg",
                Description = "Global food staple requiring high humidity and rainfall.",
                Season = "Rainy (Kharif)",
                Water = "Very High (Submerged)",
                Soil = "Heavy clay or clay loam"
            });

            Crops.Add(new Crop
            {
                Id = "onion",
                Name = "Onion",
                LocalName = "Dungri",

                Category = "Vegetables",
                ImageUrl = "/Images/crops/onion.jpg",
                Description = "Critical kitchen essential with strong medicinal properties.",
                Season = "Winter/Rainy",
                Water = "Moderate (Regular)",
                Soil = "Deep friable loam"
            });

            Crops.Add(new Crop
            {
                Id = "groundnut",
                Name = "Groundnut",
                LocalName = "Magfali",

                Category = "Oilseeds",
                ImageUrl = "/Images/crops/groundnut.jpg",
                Description = "Valuable oilseed and source of protein for cattle and humans.",
                Season = "Rainy (Kharif)",
                Water = "Low to Moderate",
                Soil = "Sandy loam soil"
            });

            // Disease Solutions (Matches PDF 2 Page 1)
            Diseases.Add(new DiseaseSolution
            {
                Id = "blast-paddy",
                Name = "Blast of Paddy",
                AffectsCrop = "PADDY (RICE)",
                Category = "FUNGAL",
                Symptom = "Spindle-shaped spots on leaves with gray center and reddish-brown margin, node blackening, and neck rot.",
                Description = "A devastating fungal disease caused by Pyricularia oryzae affecting leaves, nodes, and panicles. Early detection and fungicide application prevent catastrophic crop loss during humid monsoon weather.",
                ImageUrl = "/Images/diseases/blast_paddy.jpg",
                Treatment = "Spray Tricyclazole 75% WP @ 0.6 gm/L or Isoprothiolane 40% EC @ 1.5 ml/L of water at nursery or early tillering stage.",
                Prevention = "Avoid excessive nitrogenous fertilizer application. Use certified blast-resistant paddy varieties like Swarna and MTU 1010.",
                Severity = "High (Can reduce yield by up to 50-70%)",
                RecommendedProducts = "Tricyclazole 75 WP, Isoprothiolane 40 EC, Mancozeb 75 WP"
            });

            Diseases.Add(new DiseaseSolution
            {
                Id = "cotton-leaf-curl",
                Name = "Cotton Leaf Curl Virus",
                AffectsCrop = "COTTON",
                Category = "VIRAL",
                Symptom = "Upward curling of leaves, leaf thickening, vein swelling, and enations (outgrowths) on lower leaf surface.",
                Description = "Transmitted by the whitefly vector (Bemisia tabaci). This virus severely stunts cotton plants, preventing flower boll development and drastically lowering lint yield.",
                ImageUrl = "/Images/diseases/cotton_leaf_curl.jpg",
                Treatment = "Control whitefly vector immediately with Diafenthiuron 50% WP @ 1.25 gm/L or Imidacloprid 17.8% SL @ 0.5 ml/L water.",
                Prevention = "Destroy weed hosts around field margins. Plant vector-resistant Bt cotton hybrids approved for your region.",
                Severity = "Critical (Causes severe stunting & boll drop)",
                RecommendedProducts = "Imidacloprid 17.8 SL, Neem Oil Concentrate, Diafenthiuron 50 WP"
            });

            Diseases.Add(new DiseaseSolution
            {
                Id = "wheat-stem-rust",
                Name = "Wheat Stem Rust",
                AffectsCrop = "WHEAT",
                Category = "FUNGAL",
                Symptom = "Reddish-brown oval pustules rupture epidermis on stems, leaf sheaths, and glumes, producing powdery spores.",
                Description = "Caused by Puccinia graminis f. sp. tritici. Known as the 'policeman of wheat', spores travel long distances by wind, causing sudden and rapid lodging of wheat stalks.",
                ImageUrl = "/Images/diseases/wheat_stem_rust.jpg",
                Treatment = "Spray Propiconazole 25% EC @ 1 ml/L or Tebuconazole 25.9% EC @ 1.25 ml/L at first appearance of stem pustules.",
                Prevention = "Sow rust-resistant wheat varieties (HD 2967, DBW 187). Avoid late sowing which exposes crop to warm spore-bearing winds.",
                Severity = "Severe (Causes stem lodging & complete grain shriveling)",
                RecommendedProducts = "Propiconazole 25 EC, Mancozeb 75 WP, Tebuconazole 25.9 EC"
            });

            // Fertilizers (Matches PDF 1 Page 7 & PDF 2 Page 9)
            Fertilizers.Add(new Fertilizer
            {
                Id = "urea-46",
                Name = "Urea 46% N",
                Sku = "FRT-URE-22",
                Category = "Nitrogenous",
                Description = "The most widely used solid nitrogen fertilizer containing 46% amide nitrogen. Promotes rapid leaf growth, deep green foliage, and healthy tillering.",
                KeyFeature1 = "Basal dose and top dressing",
                KeyFeature2 = "Highly soluble in water",
                ImageUrl = "/Images/fertilizers/urea.jpg",
                NpkRatio = "46-0-0",
                StockCurrent = 12,
                StockMax = 100,
                Price = 840,
                Status = "Low Stock",
                ApplicationMethod = "Split application in 2-3 equal doses: at sowing, 25-30 days after sowing (tillering), and flowering stage.",
                RecommendedDosage = "45-50 kg per acre (varies by soil test and crop type). Neem-coated urea reduces nitrogen leaching.",
                SuitableCrops = "Paddy, Wheat, Cotton, Maize, Sugarcane, Vegetables",
                SafetyTips = "Store in dry, moisture-free storage. Apply when soil has adequate moisture; avoid application during heavy rain to prevent runoff."
            });

            Fertilizers.Add(new Fertilizer
            {
                Id = "dap-18-46-0",
                Name = "DAP (18-46-0)",
                Sku = "FRT-DAP-05",
                Category = "Complex",
                Description = "Di-ammonium Phosphate is a concentrated phosphatic fertilizer delivering 18% Nitrogen and 46% Phosphorus (P2O5). Essential for early root elongation and seedling vigour.",
                KeyFeature1 = "Ideal as basal application",
                KeyFeature2 = "Promotes strong root systems",
                ImageUrl = "/Images/fertilizers/dap.jpg",
                NpkRatio = "18-46-0",
                StockCurrent = 425,
                StockMax = 500,
                Price = 1350,
                Status = "In Stock",
                ApplicationMethod = "Full quantity as basal application during final land preparation or placed 4-5 cm below and to the side of seed.",
                RecommendedDosage = "50 kg per acre for major cereal and oilseed crops.",
                SuitableCrops = "Wheat, Paddy, Groundnut, Mustard, Pulses, Potato",
                SafetyTips = "Avoid direct contact with seeds during sowing to prevent germination burn. Keep bags sealed away from damp floors."
            });

            Fertilizers.Add(new Fertilizer
            {
                Id = "mop-60",
                Name = "MOP 60% K2O",
                Sku = "FRT-MOP-60",
                Category = "Potassic",
                Description = "Muriate of Potash (Potassium Chloride) supplies 60% K2O. Potassium regulates stomatal water loss, enhances drought tolerance, grain weight, and crop disease resistance.",
                KeyFeature1 = "Basal or split application",
                KeyFeature2 = "Increases stress tolerance",
                ImageUrl = "/Images/fertilizers/mop.jpg",
                NpkRatio = "0-0-60",
                StockCurrent = 120,
                StockMax = 200,
                Price = 1700,
                Status = "In Stock",
                ApplicationMethod = "Apply 50% at land preparation (basal) and 50% at panicle initiation or pod development stage.",
                RecommendedDosage = "25-30 kg per acre.",
                SuitableCrops = "Paddy, Cotton, Potato, Sugarcane, Banana, Groundnut",
                SafetyTips = "Do not apply on chloride-sensitive crops like Tobacco or special greenhouse ornamentals. Wear gloves during manual broadcasting."
            });

            Fertilizers.Add(new Fertilizer
            {
                Id = "vermicompost",
                Name = "Premium Vermicompost",
                Sku = "FRT-ORG-1L",
                Category = "Organic/Bio",
                Description = "100% natural organic manure produced through earthworm digestion of crop residues and cow dung. Rich in humic acid, beneficial microbes, and micronutrients.",
                KeyFeature1 = "Soil incorporation prior to sowing",
                KeyFeature2 = "Enhances soil microbiology",
                ImageUrl = "/Images/fertilizers/vermicompost.jpg",
                NpkRatio = "1.5-1.0-1.5",
                StockCurrent = 0,
                StockMax = 50,
                Price = 450,
                Status = "Out of Stock",
                ApplicationMethod = "Mix thoroughly into topsoil during field preparation or apply around plant root zones followed by light watering.",
                RecommendedDosage = "500-1000 kg per acre for field crops; 2-5 kg per fruit tree.",
                SuitableCrops = "All Crops, Vegetables, Fruit Orchards, Organic Farms, Polyhouses",
                SafetyTips = "Store under shade away from direct sunlight to preserve active beneficial soil microorganisms."
            });

            // Pesticides (Matches PDF 1 Page 10 & PDF 2 Page 10)
            Pesticides.Add(new Pesticide
            {
                Id = "chlorpyrifos",
                Name = "Chlorpyrifos 20% EC",
                Sku = "PEST-CHL-20",
                Category = "Insecticides",
                ToxicityLevel = "Highly Toxic",
                Description = "Broad-spectrum organophosphate insecticide and termiticide with contact, stomach, and respiratory action. Effective against soil-dwelling pests, stem borers, and foliar suckers.",
                Targets = "Aphids, Termites, Stem Borers, Cutworms",
                Dosage = "2-3 ml per Litre of water (Foliar spray) or 1.5-2 Litres per acre (Soil drenching for termites).",
                ImageUrl = "/Images/pesticides/chlorpyrifos.jpg",
                ExpiryDate = "Mar 2026",
                StockLevel = "12 L",
                Status = "Low Stock",
                SafetyPrecautions = "Mandatory safety gear required: Wear face mask, protective rubber gloves, and full-sleeve clothes. Do not spray against wind. Keep away from water bodies and livestock.",
                ApplicationMethod = "High-volume foliar spray using knapsack sprayer with hollow cone nozzle during early morning or late afternoon.",
                AntidoteFirstAid = "If swallowed, induce vomiting if conscious. Atropine sulfate is the specific antidote; seek immediate medical emergency care.",
                SuitableCrops = "Paddy, Cotton, Sugarcane, Vegetables, Groundnut"
            });

            Pesticides.Add(new Pesticide
            {
                Id = "neem-oil",
                Name = "Neem Oil (Azadirachtin)",
                Sku = "PEST-NEO-01",
                Category = "Bio-pesticides",
                ToxicityLevel = "Safe/Organic",
                Description = "Cold-pressed pure neem oil bio-pesticide containing 1500 PPM Azadirachtin. Acts as an antifeedant, repellent, oviposition deterrent, and insect growth regulator.",
                Targets = "Whiteflies, Mealybugs, Mites, Thrips, Aphids",
                Dosage = "3-5 ml per Litre of water + 1 ml liquid soap as emulsifier.",
                ImageUrl = "/Images/pesticides/neem_oil.jpg",
                ExpiryDate = "Oct 2026",
                StockLevel = "150 L",
                Status = "In Stock",
                SafetyPrecautions = "Safe for humans, mammals, and natural predators like ladybird beetles. Avoid spraying during peak bee foraging hours.",
                ApplicationMethod = "Thorough foliar coverage on upper and under surface of leaves. Repeat spray every 7-10 days for preventative control.",
                AntidoteFirstAid = "Non-toxic product. Rinse eyes with clean water in case of accidental eye contact.",
                SuitableCrops = "Cotton, Chili, Tomato, Brinjal, Pulses, Organic Crops"
            });

            Pesticides.Add(new Pesticide
            {
                Id = "mancozeb",
                Name = "Mancozeb 75% WP",
                Sku = "FUNG-MAN-75",
                Category = "Fungicides",
                ToxicityLevel = "Moderate Toxicity",
                Description = "Contact protective fungicide of dithiocarbamate group providing multi-site action against a broad spectrum of fungal leaf spots, blights, downy mildews, and rusts.",
                Targets = "Late Blight, Early Blight, Downy Mildew, Rust",
                Dosage = "2.0 - 2.5 grams per Litre of water (600-800 gm per acre).",
                ImageUrl = "/Images/pesticides/mancozeb.jpg",
                ExpiryDate = "Dec 2025",
                StockLevel = "45 Kg",
                Status = "In Stock",
                SafetyPrecautions = "Avoid inhalation of wettable powder dust. Wash hands thoroughly with soap after mixing and spraying.",
                ApplicationMethod = "Preventative spray before disease onset or immediately upon seeing first symptoms. Repeat at 7-14 day intervals.",
                AntidoteFirstAid = "Symptomatic treatment. Wash contaminated skin with plenty of water.",
                SuitableCrops = "Potato, Tomato, Groundnut, Paddy, Wheat, Grapes"
            });

            Pesticides.Add(new Pesticide
            {
                Id = "trichoderma",
                Name = "Trichoderma Viride",
                Sku = "PST-TRC-99",
                Category = "Bio-pesticides",
                ToxicityLevel = "Safe/Organic",
                Description = "Antagonistic bio-fungicide containing active spores of Trichoderma viride. Parasitizes and destroys harmful soil-borne fungal pathogens causing wilt and root rot.",
                Targets = "Root Rot, Collar Rot, Fusarium Wilt, Damping-off",
                Dosage = "Seed Treatment: 5-10 gm/kg seed; Soil Application: 1-2 kg mixed with 100 kg FYM/Vermicompost per acre.",
                ImageUrl = "/Images/pesticides/trichoderma.jpg",
                ExpiryDate = "Jan 2026",
                StockLevel = "80 Kg",
                Status = "In Stock",
                SafetyPrecautions = "Do not mix with chemical fungicides. Apply during evening or cloudy days to protect spore viability.",
                ApplicationMethod = "Mix with moist vermicompost/FYM, incubate for 7 days under shade, then apply to soil before sowing.",
                AntidoteFirstAid = "Eco-friendly bio-agent. Completely safe for farm workers and animals.",
                SuitableCrops = "Cotton, Groundnut, Pulses, Vegetables, Spices"
            });

            // Government Schemes (Matches PDF 1 Page 3 & PDF 2 Page 2 & PDF 3 Page 12)
            Schemes.Add(new Scheme
            {
                Id = "pm-kisan",
                Name = "PM Kisan Samman Nidhi",
                Ministry = "MINISTRY OF AGRICULTURE & FARMERS WELFARE",
                Category = "Direct Benefit",
                BenefitBadge = "₹6,000 Annual Direct Support",
                Description = "Income support of ₹6,000 per year in three equal installments of ₹2,000 directly to bank accounts of small and marginal landholding farmer families. The funds are directly deposited without any middleman.",
                Deadline = "30 Dec 2026",
                Status = "APPLY NOW",
                ActiveApps = "14,250",
                FundsAllocated = "₹ 85.5 Cr",
                Icon = "building",
                Eligibility = "All landholding farmer families owning cultivable land up to 2 hectares. Excludes income tax payers, government employees, and pension holders above ₹10,000/month.",
                RequiredDocuments = "Aadhaar Card,Land Ownership Records (7/12 Utara),Bank Passbook / Bank Account Details,Mobile Number (linked to Aadhaar),Caste Certificate (if applicable)",
                HowToApply = "1. Visit the official PM Kisan portal.\n2. Click on 'New Farmer Registration'.\n3. Select Rural or Urban Farmer.\n4. Fill in Aadhaar, bank and land details.\n5. Submit and wait for verification by local agriculture office.",
                PortalUrl = "https://pmkisan.gov.in/",
                PortalName = "pmkisan.gov.in"
            });

            Schemes.Add(new Scheme
            {
                Id = "pm-kusum",
                Name = "PM-KUSUM Solar Pump Subsidy",
                Ministry = "MINISTRY OF NEW AND RENEWABLE ENERGY",
                Category = "Government Subsidy",
                BenefitBadge = "Up to 75% Subsidy on Pumps",
                Description = "Provides financial aid to install solar water pumps for reliable off-grid farm irrigation, reducing diesel costs. Central Govt provides 30% subsidy, State provides 30-45%, farmer pays only 10%.",
                Deadline = "15 Nov 2026",
                Status = "Apply now",
                ActiveApps = "8,405",
                FundsAllocated = "₹ 45.0 Cr",
                Icon = "solar",
                Eligibility = "Individual farmers, Water User Associations, Farmer Producer Organizations (FPO), and Panchayats with existing diesel/electric pumps or no pumps at all.",
                RequiredDocuments = "Aadhaar Card,Land Records (7/12 Utara / Patta),Bank Account Details,Electricity Bill (if replacing pump),Passport Size Photo,Mobile Number",
                HowToApply = "1. Visit PM-KUSUM portal or state DISCOM website.\n2. Register as a beneficiary farmer.\n3. Select pump capacity as per land size.\n4. Pay farmer's share (10%) online.\n5. Approved installer installs pump within 60-90 days.",
                PortalUrl = "https://pmkusum.mnre.gov.in/",
                PortalName = "pmkusum.mnre.gov.in"
            });

            Schemes.Add(new Scheme
            {
                Id = "tractor-subsidy",
                Name = "Farming Tractor Subsidy Scheme",
                Ministry = "DEPARTMENT OF AGRICULTURE, GUJARAT",
                Category = "State Level Subsidy",
                BenefitBadge = "₹45,000 to ₹60,000 Subsidy",
                Description = "Assistance to state farmers for purchasing registered agricultural tractors and power tillers to modernize fieldwork. Subsidy is directly credited to bank account after purchase verification.",
                Deadline = "20 Jan 2027",
                Status = "Apply now",
                ActiveApps = "5,310",
                FundsAllocated = "₹ 28.0 Cr",
                Icon = "tractor",
                Eligibility = "Small and marginal farmers of Gujarat owning land between 1-10 hectares. One tractor per family. Must not have availed this benefit in the last 10 years.",
                RequiredDocuments = "Aadhaar Card,7/12 Land Record (Satbara),Bank Account Passbook,SC/ST Certificate (for extra benefit),Tractor Purchase Invoice,Tractor Registration Certificate (RC)",
                HowToApply = "1. Visit iKhedut Portal.\n2. Login using Aadhaar / mobile number.\n3. Select 'Tractor Subsidy Scheme'.\n4. Fill application form with land and bank details.\n5. Upload documents and submit.\n6. After approval, purchase tractor from registered dealer.",
                PortalUrl = "https://ikhedut.gujarat.gov.in/",
                PortalName = "ikhedut.gujarat.gov.in"
            });

            Schemes.Add(new Scheme
            {
                Id = "smart-fencing",
                Name = "Smart Fencing Subsidy Scheme",
                Ministry = "COOPERATIVE & AGRICULTURAL DEPARTMENT",
                Category = "Infrastructure Aid",
                BenefitBadge = "50% Fencing Cost Coverage",
                Description = "Subsidy for galvanized wire fencing around agricultural fields to protect standing cash crops from damage by wild animals. Maximum subsidy up to ₹50,000 per beneficiary.",
                Deadline = "31 Mar 2027",
                Status = "Apply now",
                ActiveApps = "4,200",
                FundsAllocated = "₹ 18.2 Cr",
                Icon = "fence",
                Eligibility = "All registered farmers in Gujarat with crop-sown land vulnerable to animal damage. Priority given to farmers in forest-fringe and semi-arid zones.",
                RequiredDocuments = "Aadhaar Card,7/12 Land Record,Bank Account Details,Village Map / Survey Number,Photo of Field (showing damage if any)",
                HowToApply = "1. Visit iKhedut Portal.\n2. Register and login.\n3. Select 'Smart Fencing Scheme' under Infrastructure Aid.\n4. Fill field details (survey no., area, location).\n5. Submit application.\n6. Village Level Officer (VLO) inspects field and approves.",
                PortalUrl = "https://ikhedut.gujarat.gov.in/",
                PortalName = "ikhedut.gujarat.gov.in"
            });

            Schemes.Add(new Scheme
            {
                Id = "bharat-urea",
                Name = "PM Bhartiya Jan Urvarak Pariyojana",
                Ministry = "MINISTRY OF CHEMICALS AND FERTILIZERS",
                Category = "Fertilizer Subsidy",
                BenefitBadge = "Highly Subsidized 'Bharat' Urea",
                Description = "Ensures uniform national quality and heavily subsidized supply of essential urea and DAP chemical fertilizers under a single brand 'Bharat'. Farmers get fertilizers at MRP fixed by Government.",
                Deadline = "Ongoing",
                Status = "Apply now",
                ActiveApps = "22,500",
                FundsAllocated = "₹ 110.0 Cr",
                Icon = "bag",
                Eligibility = "All registered farmers across India. Purchase linked to Aadhaar-based Point of Sale (PoS) system at fertilizer shops. No separate application required.",
                RequiredDocuments = "Aadhaar Card (mandatory at Point of Sale),Land Records (7/12) — for verification if asked,Kisan Credit Card (KCC) — optional but helpful",
                HowToApply = "1. Visit your nearest registered fertilizer dealer / Agro Shop.\n2. Provide Aadhaar number at the PoS machine.\n3. Biometric or OTP-based verification.\n4. Purchase 'Bharat' branded Urea / DAP at subsidized MRP.\n5. Keep receipt for records.",
                PortalUrl = "https://www.iffco.in/en/bharat-fertilizers",
                PortalName = "iffco.in / Govt Fertilizer Portal"
            });

            Schemes.Add(new Scheme
            {
                Id = "greenhouse-subsidy",
                Name = "Greenhouse & Polyhouse Subsidy",
                Ministry = "NATIONAL HORTICULTURE BOARD",
                Category = "Horticulture Focus",
                BenefitBadge = "Up to 50% Capital Assistance",
                Description = "Promotes protected high-tech cultivation of vegetables and flowers through financial aid on structural development costs. NHB provides 50% subsidy on project cost up to ₹56 lakh per hectare.",
                Deadline = "28 Feb 2027",
                Status = "Apply now",
                ActiveApps = "1,850",
                FundsAllocated = "₹ 32.5 Cr",
                Icon = "home",
                Eligibility = "Individual farmers, Self Help Groups (SHG), FPOs, Cooperatives, and Agri-Entrepreneurs with 0.5+ acres land. Farmer must arrange 50% from own funds / bank loan.",
                RequiredDocuments = "Aadhaar Card,Land Ownership Record / Lease Agreement,Project Report (technical design of greenhouse),Bank Loan Sanction Letter,Passport Size Photo,Quotation from greenhouse manufacturer",
                HowToApply = "1. Visit NHB official portal.\n2. Apply online under 'Capital Investment Subsidy Scheme'.\n3. Submit project report and land documents.\n4. Get site inspection done by NHB officer.\n5. After approval, construct greenhouse from NHB-registered contractor.\n6. Claim subsidy after construction completion certificate.",
                PortalUrl = "https://nhb.gov.in/",
                PortalName = "nhb.gov.in"
            });

            Schemes.Add(new Scheme
            {
                Id = "pm-fasal-bima",
                Name = "Pradhan Mantri Fasal Bima Yojana",
                Ministry = "MINISTRY OF AGRICULTURE & FARMERS WELFARE",
                Category = "Crop Insurance",
                BenefitBadge = "Comprehensive Crop Insurance",
                Description = "Comprehensive crop insurance against non-preventable natural risks covering loss before sowing up to post-harvest. Farmer pays only 1.5-2% premium; rest paid by Govt. Covers drought, flood, pest, hailstorm.",
                Deadline = "Active until July 2027",
                Status = "Apply now",
                ActiveApps = "19,800",
                FundsAllocated = "₹ 95.0 Cr",
                Icon = "shield",
                Eligibility = "All farmers — loanee and non-loanee — growing notified crops in notified areas. Enrollment is mandatory for loanee farmers. Optional for others.",
                RequiredDocuments = "Aadhaar Card,Bank Account Details,7/12 Land Record,Sowing Certificate from Talati / Patwari,Crop Sown Declaration Form,KCC / Loan Account Number (if loanee farmer)",
                HowToApply = "1. Visit PMFBY portal or nearest bank / CSC center.\n2. Fill crop and land details in enrollment form.\n3. Pay your share of premium (1.5% for Kharif, 2% for Rabi).\n4. Receive policy document.\n5. In case of crop loss — call toll-free 14447 within 72 hours to register claim.",
                PortalUrl = "https://pmfby.gov.in/",
                PortalName = "pmfby.gov.in"
            });

            Schemes.Add(new Scheme
            {
                Id = "micro-irrigation",
                Name = "Micro Irrigation Fund (MIF)",
                Ministry = "State Sponsored – NABARD",
                Category = "Infrastructure Aid",
                BenefitBadge = "Drip & Sprinkler Setup Subsidy",
                Description = "Financial assistance for installation of drip and sprinkler micro-irrigation systems to maximize water use efficiency. Gujarat provides 45-55% subsidy on total installation cost.",
                Deadline = "30 Jun 2027",
                Status = "Apply now",
                ActiveApps = "3,120",
                FundsAllocated = "₹ 12.4 Cr",
                Icon = "droplet",
                Eligibility = "Small, marginal, and medium farmers of Gujarat. Applicable for all crop types. Maximum area: 5 hectares per farmer for drip, 10 hectares for sprinkler.",
                RequiredDocuments = "Aadhaar Card,7/12 Land Record,Bank Account Details,Quotation from registered supplier,Soil & Water Test Report (optional but preferred)",
                HowToApply = "1. Visit iKhedut Portal.\n2. Select 'Micro Irrigation Subsidy' under Agriculture Schemes.\n3. Enter land details, crop name, and area.\n4. Upload documents.\n5. Select NABARD-registered drip/sprinkler vendor.\n6. After approval, purchase system and claim subsidy.",
                PortalUrl = "https://ikhedut.gujarat.gov.in/",
                PortalName = "ikhedut.gujarat.gov.in"
            });

            Schemes.Add(new Scheme
            {
                Id = "organic-farming",
                Name = "Organic Farming Grant (PKVY)",
                Ministry = "State Sponsored – Ministry of Agriculture",
                Category = "Government Subsidy",
                BenefitBadge = "Paramparagat Krishi Vikas Yojana",
                Description = "Financial aid and certification support for transition to organic and natural zero-budget farming. ₹50,000 per hectare for 3 years given to farmer clusters adopting 100% organic practices.",
                Deadline = "31 Dec 2026",
                Status = "Apply now",
                ActiveApps = "1,240",
                FundsAllocated = "₹ 5.2 Cr",
                Icon = "leaf",
                Eligibility = "Farmers who form a cluster of 50+ farmers covering at least 50 acres of land. Must commit to 3-year full organic transition. Supported under PKVY (Paramparagat Krishi Vikas Yojana).",
                RequiredDocuments = "Aadhaar Card,7/12 Land Record,Group/Cluster Formation Declaration,Bank Account Details,Soil Health Card,Commitment Letter for 3-Year Organic Transition",
                HowToApply = "1. Form a farmer cluster of 50+ members.\n2. Apply as a group through the nearest Krishi Vigyan Kendra (KVK) or Agriculture Office.\n3. Get cluster certified by APEDA / PGS-India.\n4. Receive ₹50,000/hectare in annual installments.\n5. Maintain organic farming records for audit.",
                PortalUrl = "https://pgsindia-ncof.gov.in/",
                PortalName = "pgsindia-ncof.gov.in"
            });

            // Saved Items (Matches PDF 1 Page 6)
            SavedItems.Add(new SavedItem
            {
                Id = "saved-1",
                Title = "Essential Tips for Golden Wheat Cultivation",
                Badge = "CROP CARE",
                Category = "Articles",
                Description = "Master the art of wheat farming with our comprehensive guide on soil preparation and...",
                SavedAgo = "Saved 2 days ago",
                ImageUrl = "/Images/saved/wheat_tips.jpg"
            });

            SavedItems.Add(new SavedItem
            {
                Id = "saved-2",
                Title = "Managing Late Blight in Potato Crops",
                Badge = "PEST CONTROL",
                Category = "Disease Info",
                Description = "Detailed prevention and treatment protocol for late blight under humid conditions in…",
                SavedAgo = "Saved 5 days ago",
                ImageUrl = "/Images/saved/potato_blight.jpg"
            });

            SavedItems.Add(new SavedItem
            {
                Id = "saved-3",
                Title = "Monsoon Planting Guide for Hybrid Cotton",
                Badge = "GUIDES",
                Category = "Guides",
                Description = "Optimizing yield during the rainy season: A step-by-step field management guide for…",
                SavedAgo = "Saved 1 week ago",
                ImageUrl = "/Images/saved/cotton_monsoon.jpg"
            });

            SavedItems.Add(new SavedItem
            {
                Id = "saved-4",
                Title = "Post-Harvest Storage for Chili Peppers",
                Badge = "HARVESTING",
                Category = "Guides",
                Description = "Reduce wastage and maintain quality with these modern storage and drying methods for…",
                SavedAgo = "Saved 2 weeks ago",
                ImageUrl = "/Images/saved/chili_storage.jpg"
            });

            SavedItems.Add(new SavedItem
            {
                Id = "saved-5",
                Title = "Brown Rust Early Warning Symptoms",
                Badge = "DISEASE INFO",
                Category = "Disease Info",
                Description = "How to identify brown rust in early stages and the recommended fungicide applications for…",
                SavedAgo = "Saved 3 weeks ago",
                ImageUrl = "/Images/saved/brown_rust.jpg"
            });

            // Stores (Matches PDF 1 Page 8 & 9)
            Stores.Add(new AgroStore
            {
                Id = "kisan-agro",
                Name = "Kisan Agro Center",
                Rating = 4.8,
                ReviewsCount = 124,
                Address = "Near Main Bus Stand, Bavla, Ahmedabad, Gujarat - 382220",
                District = "Ahmedabad",
                Phone = "+91 98765 43210",
                Timings = "09:00 AM - 08:30 PM",
                Tags = new List<string> { "Certified Seeds", "Bio-Fertilizers", "Pesticides" },
                Services = new List<string> { "Seeds", "Fertilizers", "Pesticides", "Machinery" },
                ImageUrl = "/Images/stores/kisan_agro.jpg",
                BannerUrl = "/Images/stores/kisan_agro_banner.jpg",
                Verified = true
            });

            Stores.Add(new AgroStore
            {
                Id = "patel-seeds",
                Name = "Patel Seeds & Tools",
                Rating = 4.5,
                ReviewsCount = 89,
                Address = "Market Yard, Sanand, Ahmedabad - 382110",
                District = "Ahmedabad",
                Phone = "+91 98980 12345",
                Timings = "08:30 AM - 08:00 PM",
                Tags = new List<string> { "Hybrid Seeds", "Farm Tools", "Irrigation" },
                Services = new List<string> { "Seeds", "Tools", "Irrigation" },
                ImageUrl = "/Images/stores/patel_seeds.jpg",
                BannerUrl = "/Images/stores/kisan_agro_banner.jpg",
                Verified = true
            });

            Stores.Add(new AgroStore
            {
                Id = "bharat-krushi",
                Name = "Bharat Krushi Bhandar",
                Rating = 4.2,
                ReviewsCount = 64,
                Address = "Station Road, Viramgam - 382150",
                District = "Ahmedabad",
                Phone = "+91 94260 55667",
                Timings = "09:00 AM - 07:30 PM",
                Tags = new List<string> { "Organic Pesticides", "Bulk Fertilizer" },
                Services = new List<string> { "Organic", "Fertilizers" },
                ImageUrl = "/Images/stores/bharat_krushi.jpg",
                BannerUrl = "/Images/stores/kisan_agro_banner.jpg",
                Verified = true
            });

            // Notifications (Matches PDF 2 Page 4)
            Notifications.Add(new NotificationItem
            {
                Id = "notif-1",
                Title = "PM-Kisan Installment Credited",
                Description = "Your PM-Kisan Samman Nidhi installment of ₹2000 has been credited to your linked bank account ending in 4921.",
                TimeAgo = "2 hours ago",
                Category = "Schemes",
                IconClass = "building",
                ActionText = "View Details →",
                ActionUrl = "/Farmer/Schemes.aspx"
            });

            Notifications.Add(new NotificationItem
            {
                Id = "notif-2",
                Title = "Weather Alert: Heavy Rain Expected",
                Description = "Heavy rainfall is predicted in your district for the next 48 hours. Please delay harvesting activities and secure stored crops.",
                TimeAgo = "5 hours ago",
                Category = "Crops",
                IconClass = "cloud-rain",
                ActionText = "",
                ActionUrl = ""
            });

            Notifications.Add(new NotificationItem
            {
                Id = "notif-3",
                Title = "Pest Alert: Fall Armyworm Spotted",
                Description = "Reports of Fall Armyworm infestations in nearby maize fields. Check our recommended pesticide guidelines for early prevention.",
                TimeAgo = "Yesterday",
                Category = "Disease Alerts",
                IconClass = "bug",
                ActionText = "Read Guide →",
                ActionUrl = "/Farmer/DiseaseSolutions.aspx"
            });

            Notifications.Add(new NotificationItem
            {
                Id = "notif-4",
                Title = "New Market Prices Updated",
                Description = "Today's APMC mandi prices for Cotton and Groundnut have been updated. Check current rates before selling.",
                TimeAgo = "3 days ago",
                Category = "Crops",
                IconClass = "trending-up",
                ActionText = "View Prices →",
                ActionUrl = "/Farmer/Crops.aspx"
            });

            // AgroShop Notifications & Alerts
            ShopNotifications.Add(new NotificationItem
            {
                Id = "SN-101",
                Title = "Low Stock Warning: Neem Coated Urea (50kg)",
                Description = "Stock level is down to 8 bags, falling below your safety threshold of 15 bags. Reorder recommended.",
                TimeAgo = "15 mins ago",
                Category = "Inventory",
                IconClass = "alert-triangle",
                ActionText = "Restock Inventory →",
                ActionUrl = "/Shop/NewStockUpdate.aspx"
            });

            ShopNotifications.Add(new NotificationItem
            {
                Id = "SN-102",
                Title = "New Order Placed: #ORD-9921",
                Description = "Farmer Rajesh Kumar placed a counter pickup order for 3 items (₹12,450.00). Payment completed via UPI.",
                TimeAgo = "45 mins ago",
                Category = "Orders",
                IconClass = "shopping-bag",
                ActionText = "View Order Details →",
                ActionUrl = "/Shop/OrderDetails.aspx?id=%23ORD-9921"
            });

            ShopNotifications.Add(new NotificationItem
            {
                Id = "SN-103",
                Title = "New Farmer Registered: Govindbhai Vasava",
                Description = "Govindbhai Vasava from Anand registered and added your store as primary agro-input supplier.",
                TimeAgo = "2 hours ago",
                Category = "Customers",
                IconClass = "user-plus",
                ActionText = "View Customer Profile →",
                ActionUrl = "/Shop/Customers.aspx"
            });

            ShopNotifications.Add(new NotificationItem
            {
                Id = "SN-104",
                Title = "Stock Replenishment Confirmed",
                Description = "Restock of 100 bags of Hybrid Corn Seeds (SEED-CRN-01) was successfully recorded in warehouse log.",
                TimeAgo = "5 hours ago",
                Category = "Inventory",
                IconClass = "package",
                ActionText = "Check Stock Updates →",
                ActionUrl = "/Shop/StockUpdates.aspx"
            });

            //ShopNotifications.Add(new NotificationItem
            //{
            //    Id = "SN-105",
            //    Title = "Regulatory Compliance: PM-PRANAM Bio-Fertilizer",
            //    Description = "Monthly subsidized fertilizer distribution and POS machine balance reconciliation due by 15th.",
            //    TimeAgo = "1 day ago",
            //    Category = "System",
            //    IconClass = "shield",
            //    ActionText = "View Store Profile →",
            //    ActionUrl = "/Shop/Settings.aspx"
            //});

            // AgroShop Orders (Matches PDF 2 Page 6 & PDF 3 Page 3)
            ShopOrders.Add(new ShopOrderItem
            {
                OrderId = "#ORD-9921",
                CustomerName = "Rajesh Kumar",
                CustomerAvatar = "/Images/avatars/rajesh_kumar_shop.jpg",
                DateFormatted = "Oct 24, 2023",
                TimeFormatted = "02:15 PM",
                ItemsCount = "3 Items",
                TotalAmount = 12450.00m,
                PaymentStatus = "PAID",
                OrderStatus = "DELIVERED"
            });

            ShopOrders.Add(new ShopOrderItem
            {
                OrderId = "#ORD-9920",
                CustomerName = "Anjali Sharma",
                CustomerAvatar = "/Images/avatars/anjali_sharma.jpg",
                DateFormatted = "Oct 24, 2023",
                TimeFormatted = "11:30 AM",
                ItemsCount = "5 Items",
                TotalAmount = 8200.00m,
                PaymentStatus = "PENDING",
                OrderStatus = "PENDING"
            });

            ShopOrders.Add(new ShopOrderItem
            {
                OrderId = "#ORD-9918",
                CustomerName = "Vikram Singh",
                CustomerAvatar = "/Images/avatars/vikram_singh_shop.jpg",
                DateFormatted = "Oct 23, 2023",
                TimeFormatted = "04:45 PM",
                ItemsCount = "1 Item",
                TotalAmount = 3500.00m,
                PaymentStatus = "PAID",
                OrderStatus = "DELIVERED"
            });

            ShopOrders.Add(new ShopOrderItem
            {
                OrderId = "#ORD-9915",
                CustomerName = "Meera Devi",
                CustomerAvatar = "/Images/avatars/meera_devi.jpg",
                DateFormatted = "Oct 23, 2023",
                TimeFormatted = "09:20 AM",
                ItemsCount = "2 Items",
                TotalAmount = 1250.00m,
                PaymentStatus = "REFUNDED",
                OrderStatus = "CANCELLED"
            });

            ShopOrders.Add(new ShopOrderItem
            {
                OrderId = "#ORD-9912",
                CustomerName = "Suresh Patel",
                CustomerAvatar = "/Images/avatars/suresh_kumar.jpg",
                DateFormatted = "Oct 22, 2023",
                TimeFormatted = "03:10 PM",
                ItemsCount = "8 Items",
                TotalAmount = 22900.00m,
                PaymentStatus = "PAID",
                OrderStatus = "DELIVERED"
            });

            // AgroShop Products (Matches PDF 2 Pages 7, 8, 9, 10)
            ShopProducts.Add(new ShopProduct
            {
                Sku = "SEED-CRN-01",
                Name = "Hybrid Corn Seeds",
                Category = "Seeds",
                StockLevel = "450 / 500",
                StockCurrent = 450,
                StockMax = 500,
                Price = 1250,
                CostPrice = 950,
                Status = "In Stock",
                ImageUrl = "/Images/products/hybrid_corn_seeds.jpg",
                Description = "High germination hybrid maize seeds suitable for Kharif season.",
                StoreId = "kisan-agro"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "FRT-URE-22",
                Name = "Urea Nitrogen 46%",
                Category = "Fertilizers",
                Type = "Nitrogenous",
                NpkRatio = "46-0-0",
                StockLevel = "12 / 100",
                StockCurrent = 12,
                StockMax = 100,
                Price = 840,
                CostPrice = 650,
                Status = "Low Stock",
                ImageUrl = "/Images/products/urea_nitrogen.jpg",
                Description = "Standard agricultural prilled urea fertilizer with 46% nitrogen.",
                StoreId = "kisan-agro"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "PST-NEM-44",
                Name = "Neem Oil Concentrate",
                Category = "Pesticides",
                TargetPest = "Aphids, Whiteflies",
                ToxicityLevel = "Low (Organic)",
                ExpiryDate = "Oct 2026",
                StockLevel = "210 / 300",
                StockCurrent = 210,
                StockMax = 300,
                Price = 420,
                CostPrice = 280,
                Status = "In Stock",
                ImageUrl = "/Images/products/neem_oil_concentrate.jpg",
                Description = "Pure cold-pressed neem oil pest repellent for organic farming.",
                StoreId = "kisan-agro"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "FRT-DAP-05",
                Name = "DAP (Di-ammonium Phosphate)",
                Category = "Fertilizers",
                Type = "Complex",
                NpkRatio = "18-46-0",
                StockLevel = "425 / 500",
                StockCurrent = 425,
                StockMax = 500,
                Price = 1350,
                CostPrice = 1100,
                Status = "In Stock",
                ImageUrl = "/Images/products/dap_fertilizer.jpg",
                Description = "Di-ammonium Phosphate 18:46:0 high phosphorus fertilizer.",
                StoreId = "kisan-agro"
            });

            // Patel Seeds & Tools products
            ShopProducts.Add(new ShopProduct
            {
                Sku = "TOL-TRW-09",
                Name = "Steel Hand Trowel",
                Category = "Tools",
                StockLevel = "0 / 50",
                StockCurrent = 0,
                StockMax = 50,
                Price = 350,
                CostPrice = 220,
                Status = "Out of Stock",
                ImageUrl = "/Images/products/steel_trowel.jpg",
                Description = "Ergonomic rust-resistant steel gardening hand trowel.",
                StoreId = "patel-seeds"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "FRT-ORG-1L",
                Name = "Organic Bio-Fertilizer Liquid",
                Category = "Fertilizers",
                Type = "Organic",
                NpkRatio = "N/A",
                StockLevel = "0 / 50",
                StockCurrent = 0,
                StockMax = 50,
                Price = 450,
                CostPrice = 300,
                Status = "Out of Stock",
                ImageUrl = "/Images/products/organic_liquid.jpg",
                Description = "Enriched liquid bio-fertilizer with mycorrhizal inoculants.",
                StoreId = "patel-seeds"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "FRT-MOP-60",
                Name = "MOP (Muriate of Potash)",
                Category = "Fertilizers",
                Type = "Potassic",
                NpkRatio = "0-0-60",
                StockLevel = "120 / 200",
                StockCurrent = 120,
                StockMax = 200,
                Price = 1700,
                CostPrice = 1450,
                Status = "In Stock",
                ImageUrl = "/Images/products/mop_potash.jpg",
                Description = "Muriate of potash 60% K2O for root and stalk strength.",
                StoreId = "patel-seeds"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "SEED-WHT-07",
                Name = "Wheat Seeds GW-322",
                Category = "Seeds",
                StockLevel = "300 / 400",
                StockCurrent = 300,
                StockMax = 400,
                Price = 980,
                CostPrice = 720,
                Status = "In Stock",
                ImageUrl = "/Images/products/hybrid_corn_seeds.jpg",
                Description = "High-yielding Rabi wheat variety with lodging resistance, suited for Gujarat irrigated fields.",
                StoreId = "patel-seeds"
            });

            // Bharat Krushi Bhandar products
            ShopProducts.Add(new ShopProduct
            {
                Sku = "PEST-CHL-20",
                Name = "Chlorpyrifos 20% EC",
                Category = "Pesticides",
                TargetPest = "Termites, Borers",
                ToxicityLevel = "High",
                ExpiryDate = "Mar 2026",
                StockLevel = "12 L",
                StockCurrent = 12,
                StockMax = 100,
                Price = 650,
                CostPrice = 480,
                Status = "Low Stock",
                ImageUrl = "/Images/pesticides/chlorpyrifos.jpg",
                Description = "Chlorpyrifos 20% EC broad-spectrum insecticide for soil-borne pests.",
                StoreId = "bharat-krushi"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "FUNG-MAN-75",
                Name = "Mancozeb 75% WP",
                Category = "Pesticides",
                TargetPest = "Blight, Mildew",
                ToxicityLevel = "Moderate",
                ExpiryDate = "Dec 2025",
                StockLevel = "45 Kg",
                StockCurrent = 45,
                StockMax = 200,
                Price = 780,
                CostPrice = 590,
                Status = "In Stock",
                ImageUrl = "/Images/pesticides/mancozeb.jpg",
                Description = "Mancozeb 75% WP agricultural contact fungicide for downy mildew and blight control.",
                StoreId = "bharat-krushi"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "FRT-BLK-50",
                Name = "Bulk Organic Compost (50 Kg)",
                Category = "Fertilizers",
                Type = "Organic",
                NpkRatio = "N/A",
                StockLevel = "200 / 500",
                StockCurrent = 200,
                StockMax = 500,
                Price = 320,
                CostPrice = 180,
                Status = "In Stock",
                ImageUrl = "/Images/products/organic_liquid.jpg",
                Description = "Vermicompost enriched organic manure — improves soil structure and microbial activity.",
                StoreId = "bharat-krushi"
            });

            ShopProducts.Add(new ShopProduct
            {
                Sku = "SEED-GND-03",
                Name = "Groundnut Seeds (Bold 187)",
                Category = "Seeds",
                StockLevel = "150 / 300",
                StockCurrent = 150,
                StockMax = 300,
                Price = 1100,
                CostPrice = 820,
                Status = "In Stock",
                ImageUrl = "/Images/products/hybrid_corn_seeds.jpg",
                Description = "Bold-type groundnut variety with high oil content (50%), suitable for Kharif planting in Gujarat.",
                StoreId = "bharat-krushi"
            });

            // Stock Updates (Matches PDF 3 Page 2)
            StockUpdates.Add(new StockUpdateRecord
            {
                DateTimeFormatted = "Oct 24, 2023\n10:30 AM",
                ProductName = "Hybrid Corn Seeds",
                Sku = "SEED-CRN-01",
                UpdateType = "RESTOCK",
                QtyChange = 50,
                NewStock = 450,
                UpdatedBy = "Rahul Sharma",
                UpdatedByAvatar = "/Images/avatars/rahul_desai.jpg",
                ProductImage = "/Images/products/hybrid_corn_seeds.jpg"
            });

            StockUpdates.Add(new StockUpdateRecord
            {
                DateTimeFormatted = "Oct 24, 2023\n09:15 AM",
                ProductName = "Urea Nitrogen 46%",
                Sku = "FRT-URE-22",
                UpdateType = "SALE",
                QtyChange = -8,
                NewStock = 12,
                UpdatedBy = "Priya Patel",
                UpdatedByAvatar = "/Images/avatars/priya_sharma.jpg",
                ProductImage = "/Images/products/urea_nitrogen.jpg"
            });

            StockUpdates.Add(new StockUpdateRecord
            {
                DateTimeFormatted = "Oct 23, 2023\n04:45 PM",
                ProductName = "Neem Oil Concentrate",
                Sku = "PST-NEM-44",
                UpdateType = "ADJUSTMENT",
                QtyChange = 2,
                NewStock = 210,
                UpdatedBy = "Rahul Sharma",
                UpdatedByAvatar = "/Images/avatars/rahul_desai.jpg",
                ProductImage = "/Images/products/neem_oil_concentrate.jpg"
            });

            StockUpdates.Add(new StockUpdateRecord
            {
                DateTimeFormatted = "Oct 23, 2023\n02:20 PM",
                ProductName = "Steel Hand Trowel",
                Sku = "TOL-TRW-09",
                UpdateType = "DAMAGE",
                QtyChange = -1,
                NewStock = 0,
                UpdatedBy = "Amit Varma",
                UpdatedByAvatar = "/Images/avatars/amit_sharma.jpg",
                ProductImage = "/Images/products/steel_trowel.jpg"
            });

            StockUpdates.Add(new StockUpdateRecord
            {
                DateTimeFormatted = "Oct 22, 2023\n11:05 AM",
                ProductName = "Urea Nitrogen 46%",
                Sku = "FRT-URE-22",
                UpdateType = "SALE",
                QtyChange = -20,
                NewStock = 20,
                UpdatedBy = "Priya Patel",
                UpdatedByAvatar = "/Images/avatars/priya_sharma.jpg",
                ProductImage = "/Images/products/urea_nitrogen.jpg"
            });

            // Customers (Matches PDF 3 Page 4)
            Customers.Add(new ShopCustomer
            {
                Id = "#C-4920",
                Name = "Rajesh Kumar",
                AvatarUrl = "/Images/avatars/rajesh_kumar_shop.jpg",
                Email = "rajesh.k@example.com",
                Phone = "+91 98765 43210",
                LastOrderDate = "Oct 12, 2023",
                TotalSpent = 1240.50m,
                Status = "Active",
                Location = "Anand"
            });

            Customers.Add(new ShopCustomer
            {
                Id = "#C-4921",
                Name = "Priya Sharma",
                AvatarUrl = "/Images/avatars/priya_sharma.jpg",
                Email = "p.sharma@farm.com",
                Phone = "+91 99887 76655",
                LastOrderDate = "Oct 11, 2023",
                TotalSpent = 845.20m,
                Status = "Active",
                Location = "Mehsana"
            });

            Customers.Add(new ShopCustomer
            {
                Id = "#C-4922",
                Name = "Amit Patel",
                AvatarUrl = "/Images/avatars/amit_patel.jpg",
                Email = "amit.p@org.co",
                Phone = "+91 91234 56789",
                LastOrderDate = "Sep 28, 2023",
                TotalSpent = 2410.00m,
                Status = "Inactive",
                Location = "Rajkot"
            });

            Customers.Add(new ShopCustomer
            {
                Id = "#C-4923",
                Name = "Sunita Reddy",
                AvatarUrl = "/Images/avatars/sunita_reddy.jpg",
                Email = "reddy.s@mail.com",
                Phone = "+91 94567 89012",
                LastOrderDate = "Oct 10, 2023",
                TotalSpent = 150.00m,
                Status = "Active",
                Location = "Sanand"
            });

            Customers.Add(new ShopCustomer
            {
                Id = "#C-4924",
                Name = "Vikram Singh",
                AvatarUrl = "/Images/avatars/vikram_singh_shop.jpg",
                Email = "singh.v@farmnet.net",
                Phone = "+91 97890 12345",
                LastOrderDate = "Oct 05, 2023",
                TotalSpent = 3245.80m,
                Status = "Active",
                Location = "Bavla"
            });

            Customers.Add(new ShopCustomer
            {
                Id = "#C-4925",
                Name = "Ananya Das",
                AvatarUrl = "/Images/avatars/ananya_das.jpg",
                Email = "ananya.d@harvest.com",
                Phone = "+91 90123 45678",
                LastOrderDate = "Sep 15, 2023",
                TotalSpent = 567.00m,
                Status = "Inactive",
                Location = "Viramgam"
            });

            // Admin Farmers (Matches PDF 3 Page 9)
            AdminFarmers.Add(new AdminFarmer
            {
                Name = "Raju Patel",
                AvatarUrl = "/Images/avatars/raju_patel.jpg",
                Location = "Anand, Gujarat",
                ContactNumber = "+91 98765 43210",
                RegisteredDate = "12 Oct 2023",
                Status = "Active"
            });

            AdminFarmers.Add(new AdminFarmer
            {
                Name = "Suresh Kumar",
                AvatarUrl = "/Images/avatars/suresh_kumar.jpg",
                Location = "Mehsana, Gujarat",
                ContactNumber = "+91 99887 76655",
                RegisteredDate = "05 Oct 2023",
                Status = "Active"
            });

            AdminFarmers.Add(new AdminFarmer
            {
                Name = "Amit Sharma",
                AvatarUrl = "/Images/avatars/amit_sharma.jpg",
                Location = "Rajkot, Gujarat",
                ContactNumber = "+91 91234 56789",
                RegisteredDate = "28 Sep 2023",
                Status = "Blocked"
            });

            AdminFarmers.Add(new AdminFarmer
            {
                Name = "Vikram Singh",
                AvatarUrl = "/Images/avatars/vikram_singh.jpg",
                Location = "Anand, Gujarat",
                ContactNumber = "+91 94567 12345",
                RegisteredDate = "20 Sep 2023",
                Status = "Active"
            });

            AdminFarmers.Add(new AdminFarmer
            {
                Name = "Rajesh Gadhavi",
                AvatarUrl = "/Images/avatars/rajesh_gadhavi.jpg",
                Location = "Kutch, Gujarat",
                ContactNumber = "+91 97865 34210",
                RegisteredDate = "15 Sep 2023",
                Status = "Active"
            });

            // Admin Shops (Matches PDF 3 Page 10)
            AdminShops.Add(new AdminShop
            {
                Name = "Green Valley Agro",
                AvatarUrl = "/Images/stores/green_valley.jpg",
                Owner = "Karan Singh",
                Location = "Mehsana, Gujarat",
                Verification = "Verified"
            });

            AdminShops.Add(new AdminShop
            {
                Name = "Sardar Fertilizer Hub",
                AvatarUrl = "/Images/stores/sardar_fertilizer.jpg",
                Owner = "Harish Patel",
                Location = "Anand, Gujarat",
                Verification = "Pending"
            });

            AdminShops.Add(new AdminShop
            {
                Name = "Khedut Beej Bhandar",
                AvatarUrl = "/Images/stores/khedut_beej.jpg",
                Owner = "Jayanti Bhai",
                Location = "Rajkot, Gujarat",
                Verification = "Verified"
            });

            AdminShops.Add(new AdminShop
            {
                Name = "Ambika Biotech Store",
                AvatarUrl = "/Images/stores/ambika_biotech.jpg",
                Owner = "Mahendra Shah",
                Location = "Surat, Gujarat",
                Verification = "Pending"
            });

            AdminShops.Add(new AdminShop
            {
                Name = "Organic Earth Solutions",
                AvatarUrl = "/Images/stores/organic_earth.jpg",
                Owner = "Piyush Parmar",
                Location = "Kutch, Gujarat",
                Verification = "Verified"
            });

            // Admin Activities (Matches PDF 3 Page 8)
            AdminActivities.Add(new AdminActivity
            {
                Title = "New farmer Raju Patel registered from Anand district",
                TimeAgo = "5 mins ago",
                AvatarUrl = "/Images/avatars/raju_patel.jpg",
                Type = "farmer"
            });

            AdminActivities.Add(new AdminActivity
            {
                Title = "Green Valley Shop verified & approved in Mehsana",
                TimeAgo = "2 hours ago",
                AvatarUrl = "/Images/stores/green_valley.jpg",
                Type = "shop"
            });

            AdminActivities.Add(new AdminActivity
            {
                Title = "New subsidy product 'Organic Compost' pending approval",
                TimeAgo = "1 day ago",
                AvatarUrl = "/Images/avatars/amit_patel.jpg",
                Type = "product"
            });

            AdminActivities.Add(new AdminActivity
            {
                Title = "Sardar Agro Center listed 12 new hybrid cotton seeds",
                TimeAgo = "1 day ago",
                AvatarUrl = "/Images/stores/sardar_fertilizer.jpg",
                Type = "shop"
            });

            // Admin Users (Matches PDF 3 Page 13)
            AdminUsers.Add(new AdminUserItem
            {
                Name = "Rahul Desai",
                Email = "rahul.d@khedutplus.in",
                AvatarUrl = "/Images/avatars/rahul_desai.jpg",
                Role = "Field Officer",
                Region = "Ahmedabad, Gujarat",
                LastLogin = "2 hours ago",
                Status = "Active"
            });

            AdminUsers.Add(new AdminUserItem
            {
                Name = "Meera Patel",
                Email = "meera.agro@gmail.com",
                Initials = "MP",
                Role = "Shop Owner",
                Region = "Surat, Gujarat",
                LastLogin = "Yesterday",
                Status = "Active"
            });

            AdminUsers.Add(new AdminUserItem
            {
                Name = "Amit Shah",
                Email = "amit.s@khedutplus.in",
                AvatarUrl = "/Images/avatars/amit_shah.jpg",
                Role = "Admin",
                Region = "Gandhinagar, Gujarat",
                LastLogin = "Just now",
                Status = "Active"
            });

            AdminUsers.Add(new AdminUserItem
            {
                Name = "Vikram Joshi",
                Email = "vikram.j@khedutplus.in",
                Initials = "VJ",
                Role = "Field Officer",
                Region = "Rajkot, Gujarat",
                LastLogin = "Oct 12, 2023",
                Status = "Inactive"
            });
        }
    }
}
