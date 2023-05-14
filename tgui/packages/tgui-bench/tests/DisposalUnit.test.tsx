<<<<<<< HEAD
import { backendUpdate } from 'tgui/backend';
import { DisposalUnit } from 'tgui/interfaces/DisposalUnit';
import { createRenderer } from 'tgui/renderer';
import { configureStore, StoreProvider } from 'tgui/store';

const store = configureStore({ sideEffets: false });
=======
import { StoreProvider, configureStore } from 'tgui/store';

import { DisposalUnit } from 'tgui/interfaces/DisposalUnit';
import { backendUpdate } from 'tgui/backend';
import { createRenderer } from 'tgui/renderer';

const store = configureStore({ sideEffects: false });
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

const renderUi = createRenderer((dataJson: string) => {
  store.dispatch(
    backendUpdate({
      data: Byond.parseJson(dataJson),
    })
  );
  return (
    <StoreProvider store={store}>
      <DisposalUnit />
    </StoreProvider>
  );
});

export const data = JSON.stringify({
  flush: 0,
  full_pressure: 1,
  pressure_charging: 0,
  panel_open: 0,
  per: 1,
  isai: 0,
});

export const Default = () => renderUi(data);
