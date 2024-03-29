import 'package:faker/faker.dart';
import 'package:projeto_criptos/portfolio/model/crypto_view_data.dart';
import 'package:projeto_criptos/shared/utils/decimal_parse.dart';

class TestAsset {
  static CryptoViewData cryptoViewData = CryptoViewData(
    id: 'bitcoin',
    symbol: 'BTC',
    name: '',
    image: Faker().image.image(),
    currentPrice: dp('250'),
    variation: 6,
  );
  static CryptoViewData cryptoViewData2 = CryptoViewData(
    id: 'ethereum',
    symbol: 'ETH',
    name: '',
    image: Faker().image.image(),
    currentPrice: dp('250'),
    variation: 6,
  );
  static CryptoViewData cryptoViewData3 = CryptoViewData(
    id: 'litecoin',
    symbol: 'LTC',
    name: '',
    image: Faker().image.image(),
    currentPrice: dp('250'),
    variation: 6,
  );
}
