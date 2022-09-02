class ProductMaster {
  // List<Null>? searchCategoryArr;
  // List<Null>? searchBrandArr;
  List<Categories>? categories;
  List<Brands>? brands;
  List<ActiveVariants>? activeVariants;
  Products? products;
  SeoSetting? seoSetting;
  ShopPageCenterBanner? shopPageCenterBanner;
  ShopPageSidebarBanner? shopPageSidebarBanner;

  ProductMaster(
      {
        // this.searchCategoryArr,
        // this.searchBrandArr,
        this.categories,
        this.brands,
        this.activeVariants,
        this.products,
        this.seoSetting,
        this.shopPageCenterBanner,
        this.shopPageSidebarBanner});

  ProductMaster.fromJson(Map<String, dynamic> json) {
    // if (json['searchCategoryArr'] != null) {
    //   searchCategoryArr = <Null>[];
    //   json['searchCategoryArr'].forEach((v) {
    //     searchCategoryArr!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['searchBrandArr'] != null) {
    //   searchBrandArr = <Null>[];
    //   json['searchBrandArr'].forEach((v) {
    //     searchBrandArr!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    if (json['activeVariants'] != null) {
      activeVariants = <ActiveVariants>[];
      json['activeVariants'].forEach((v) {
        activeVariants!.add(new ActiveVariants.fromJson(v));
      });
    }
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    seoSetting = json['seoSetting'] != null
        ? new SeoSetting.fromJson(json['seoSetting'])
        : null;
    shopPageCenterBanner = json['shopPageCenterBanner'] != null
        ? new ShopPageCenterBanner.fromJson(json['shopPageCenterBanner'])
        : null;
    shopPageSidebarBanner = json['shopPageSidebarBanner'] != null
        ? new ShopPageSidebarBanner.fromJson(json['shopPageSidebarBanner'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.searchCategoryArr != null) {
    //   data['searchCategoryArr'] =
    //       this.searchCategoryArr!.map((v) => v.toJson()).toList();
    // }
    // if (this.searchBrandArr != null) {
    //   data['searchBrandArr'] =
    //       this.searchBrandArr!.map((v) => v.toJson()).toList();
    // }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    if (this.activeVariants != null) {
      data['activeVariants'] =
          this.activeVariants!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.seoSetting != null) {
      data['seoSetting'] = this.seoSetting!.toJson();
    }
    if (this.shopPageCenterBanner != null) {
      data['shopPageCenterBanner'] = this.shopPageCenterBanner!.toJson();
    }
    if (this.shopPageSidebarBanner != null) {
      data['shopPageSidebarBanner'] = this.shopPageSidebarBanner!.toJson();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  String? icon;
  List<ActiveSubCategories>? activeSubCategories;

  Categories(
      {this.id, this.name, this.slug, this.icon, this.activeSubCategories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    if (json['active_sub_categories'] != null) {
      activeSubCategories = <ActiveSubCategories>[];
      json['active_sub_categories'].forEach((v) {
        activeSubCategories!.add(new ActiveSubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    if (this.activeSubCategories != null) {
      data['active_sub_categories'] =
          this.activeSubCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveSubCategories {
  int? id;
  String? name;
  String? slug;
  String? categoryId;
  List<ActiveChildCategories>? activeChildCategories;

  ActiveSubCategories(
      {this.id,
        this.name,
        this.slug,
        this.categoryId,
        this.activeChildCategories});

  ActiveSubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    categoryId = json['category_id'];
    if (json['active_child_categories'] != null) {
      activeChildCategories = <ActiveChildCategories>[];
      json['active_child_categories'].forEach((v) {
        activeChildCategories!.add(new ActiveChildCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    if (this.activeChildCategories != null) {
      data['active_child_categories'] =
          this.activeChildCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveChildCategories {
  int? id;
  String? name;
  String? slug;
  String? subCategoryId;

  ActiveChildCategories({this.id, this.name, this.slug, this.subCategoryId});

  ActiveChildCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    subCategoryId = json['sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['sub_category_id'] = this.subCategoryId;
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  String? slug;

  Brands({this.id, this.name, this.slug});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class ActiveVariants {
  String? name;
  int? id;
  List<ActiveVariantItems>? activeVariantItems;

  ActiveVariants({this.name, this.id, this.activeVariantItems});

  ActiveVariants.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['active_variant_items'] != null) {
      activeVariantItems = <ActiveVariantItems>[];
      json['active_variant_items'].forEach((v) {
        activeVariantItems!.add(new ActiveVariantItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.activeVariantItems != null) {
      data['active_variant_items'] =
          this.activeVariantItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveVariantItems {
  String? productVariantId;
  String? name;
  String? price;
  int? id;

  ActiveVariantItems({this.productVariantId, this.name, this.price, this.id});

  ActiveVariantItems.fromJson(Map<String, dynamic> json) {
    productVariantId = json['product_variant_id'];
    name = json['name'];
    price = json['price'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_variant_id'] = this.productVariantId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['id'] = this.id;
    return data;
  }
}

class Products {
  int? currentPage;
  List<Product>? product;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Products(
      {this.currentPage,
        this.product,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.product != null) {
      data['data'] = this.product!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? shortName;
  String? slug;
  String? thumbImage;
  String? qty;
  String? soldQty;
  String? price;
  String? offerPrice;
  String? isUndefine;
  String? isFeatured;
  String? newProduct;
  String? isTop;
  String? isBest;
  String? categoryId;
  String? subCategoryId;
  String? childCategoryId;
  String? brandId;
  String? averageRating;
  List<ActiveVariants>? activeVariants;

  Product(
      {this.id,
        this.name,
        this.shortName,
        this.slug,
        this.thumbImage,
        this.qty,
        this.soldQty,
        this.price,
        this.offerPrice,
        this.isUndefine,
        this.isFeatured,
        this.newProduct,
        this.isTop,
        this.isBest,
        this.categoryId,
        this.subCategoryId,
        this.childCategoryId,
        this.brandId,
        this.averageRating,
        this.activeVariants});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    slug = json['slug'];
    thumbImage = json['thumb_image'];
    qty = json['qty'];
    soldQty = json['sold_qty'];
    price = json['price'];
    offerPrice = json['offer_price'];
    isUndefine = json['is_undefine'];
    isFeatured = json['is_featured'];
    newProduct = json['new_product'];
    isTop = json['is_top'];
    isBest = json['is_best'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    childCategoryId = json['child_category_id'];
    brandId = json['brand_id'];
    averageRating = json['averageRating'];
    if (json['active_variants'] != null) {
      activeVariants = <ActiveVariants>[];
      json['active_variants'].forEach((v) {
        activeVariants!.add(new ActiveVariants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['slug'] = this.slug;
    data['thumb_image'] = this.thumbImage;
    data['qty'] = this.qty;
    data['sold_qty'] = this.soldQty;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['is_undefine'] = this.isUndefine;
    data['is_featured'] = this.isFeatured;
    data['new_product'] = this.newProduct;
    data['is_top'] = this.isTop;
    data['is_best'] = this.isBest;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['child_category_id'] = this.childCategoryId;
    data['brand_id'] = this.brandId;
    data['averageRating'] = this.averageRating;
    if (this.activeVariants != null) {
      data['active_variants'] =
          this.activeVariants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveVariantsPro {
  int? id;
  String? name;
  String? productId;
  List<ActiveVariantItems>? activeVariantItems;

  ActiveVariantsPro({this.id, this.name, this.productId, this.activeVariantItems});

  ActiveVariantsPro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    if (json['active_variant_items'] != null) {
      activeVariantItems = <ActiveVariantItems>[];
      json['active_variant_items'].forEach((v) {
        activeVariantItems!.add(new ActiveVariantItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productId;
    if (this.activeVariantItems != null) {
      data['active_variant_items'] =
          this.activeVariantItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}

class SeoSetting {
  int? id;
  String? pageName;
  String? seoTitle;
  String? seoDescription;
  Null? createdAt;
  String? updatedAt;

  SeoSetting(
      {this.id,
        this.pageName,
        this.seoTitle,
        this.seoDescription,
        this.createdAt,
        this.updatedAt});

  SeoSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageName = json['page_name'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_name'] = this.pageName;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ShopPageCenterBanner {
  String? link;
  String? image;
  String? bannerLocation;
  String? status;
  String? afterProductQty;

  ShopPageCenterBanner(
      {this.link,
        this.image,
        this.bannerLocation,
        this.status,
        this.afterProductQty});

  ShopPageCenterBanner.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    image = json['image'];
    bannerLocation = json['banner_location'];
    status = json['status'];
    afterProductQty = json['after_product_qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['image'] = this.image;
    data['banner_location'] = this.bannerLocation;
    data['status'] = this.status;
    data['after_product_qty'] = this.afterProductQty;
    return data;
  }
}

class ShopPageSidebarBanner {
  String? link;
  String? image;
  String? bannerLocation;
  String? status;

  ShopPageSidebarBanner(
      {this.link, this.image, this.bannerLocation, this.status});

  ShopPageSidebarBanner.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    image = json['image'];
    bannerLocation = json['banner_location'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    data['image'] = this.image;
    data['banner_location'] = this.bannerLocation;
    data['status'] = this.status;
    return data;
  }
}
