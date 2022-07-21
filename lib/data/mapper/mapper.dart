import 'package:flutter_advanced_clean_architecture_with_mvvm/app/constants.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/data/response/responses.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:flutter_advanced_clean_architecture_with_mvvm/app/extensions.dart';

extension CustomerResposeMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constants.empty,
      this?.name.orEmpty() ?? Constants.empty,
      this?.numOfNotifications.orZero() ?? Constants.zero,
    );
  }
}

extension ContactsResposeMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResposeMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contacts.toDomain(),
    );
  }
}

extension ForgetPasswordResponseMapper on ForgetPasswordResponse? {
  String toDomain() {
    return this?.support.orEmpty() ?? Constants.empty;
  }
}

extension ServiceResponseMapper on ServicesResponse? {
  Service toDomain() {
    return Service(
      this?.id.orEmpty() ?? Constants.empty,
      this?.title.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension StoreResponseMapper on StoresResponse? {
  Store toDomain() {
    return Store(
      this?.id.orEmpty() ?? Constants.empty,
      this?.title.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension BannerResponseMapper on BannersResponse? {
  BannerAd toDomain() {
    return BannerAd(
      this?.id.orEmpty() ?? Constants.empty,
      this?.link.orEmpty() ?? Constants.empty,
      this?.title.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services = (this
                ?.data
                ?.services
                ?.map((serviceResponse) => serviceResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();

    List<BannerAd> banners = (this
                ?.data
                ?.banners
                ?.map((bannerResponse) => bannerResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();

    List<Store> stores =
        (this?.data?.stores?.map((storeResponse) => storeResponse.toDomain()) ??
                const Iterable.empty())
            .cast<Store>()
            .toList();

    var data = HomeData(services, banners, stores);
    return HomeObject(data);
  }
}
