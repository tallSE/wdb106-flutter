import 'package:mono_kit/mono_kit.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:wdb106_sample/model/model.dart';

import 'item_tile_state.dart';

export 'item_tile_state.dart';

class ItemTileController extends StateNotifier<ItemTileState>
    with LocatorMixin {
  ItemTileController({
    @required this.stock,
  }) : super(ItemTileState()) {
    _sb.add(
      _cartStore.items.listen((items) {
        final cartItem = items.firstWhere(
          (x) => x.item == stock.item,
          orElse: () => null,
        );
        final cartItemQuantity = cartItem?.quantity ?? 0;
        state = state.copyWith(
          quantity: stock.quantity - cartItemQuantity,
        );
      }),
    );
  }

  final ItemStock stock;
  final _sb = SubscriptionHolder();

  CartStore get _cartStore => read();

  void addToCart() => _cartStore.add(stock.item);

  @override
  void dispose() {
    _sb.dispose();

    super.dispose();
  }
}