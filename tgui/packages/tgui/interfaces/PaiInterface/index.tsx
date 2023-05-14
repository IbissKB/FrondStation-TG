import { useLocalState } from 'tgui/backend';
import { Stack, Tabs } from 'tgui/components';
import { Window } from 'tgui/layouts';
<<<<<<< HEAD
import { TAB } from './constants';
=======
import { PAI_TAB } from './constants';
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
import { AvailableDisplay } from './Available';
import { DirectiveDisplay } from './Directives';
import { InstalledDisplay } from './Installed';
import { SystemDisplay } from './System';
<<<<<<< HEAD
import { Data } from './types';

export const PaiInterface = (props, context: Data) => {
  const [tab, setTab] = useLocalState(context, 'tab', TAB.System);
=======

export const PaiInterface = (props, context) => {
  const [tab] = useLocalState(context, 'tab', PAI_TAB.System);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

  return (
    <Window title="pAI Software Interface v2.5" width={380} height={480}>
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item grow>
<<<<<<< HEAD
            {tab === TAB.System && <SystemDisplay />}
            {tab === TAB.Directive && <DirectiveDisplay />}
            {tab === TAB.Installed && <InstalledDisplay />}
            {tab === TAB.Available && <AvailableDisplay />}
=======
            {tab === PAI_TAB.System && <SystemDisplay />}
            {tab === PAI_TAB.Directive && <DirectiveDisplay />}
            {tab === PAI_TAB.Installed && <InstalledDisplay />}
            {tab === PAI_TAB.Available && <AvailableDisplay />}
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
          </Stack.Item>
          <Stack.Item>
            <TabDisplay />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

/**
 * Tabs at bottom of screen. YES THIS IS INTENTIONAL. It's a phone screen
 * and the buttons are on the bottom. Android!
 */
const TabDisplay = (props, context) => {
<<<<<<< HEAD
  const [tab, setTab] = useLocalState(context, 'tab', TAB.System);
=======
  const [tab, setTab] = useLocalState(context, 'tab', PAI_TAB.System);
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

  return (
    <Tabs fluid>
      <Tabs.Tab
        icon="list"
<<<<<<< HEAD
        onClick={() => setTab(TAB.System)}
        selected={tab === TAB.System}>
=======
        onClick={() => setTab(PAI_TAB.System)}
        selected={tab === PAI_TAB.System}>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
        System
      </Tabs.Tab>
      <Tabs.Tab
        icon="list"
<<<<<<< HEAD
        onClick={() => setTab(TAB.Directive)}
        selected={tab === TAB.Directive}>
=======
        onClick={() => setTab(PAI_TAB.Directive)}
        selected={tab === PAI_TAB.Directive}>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
        Directives
      </Tabs.Tab>
      <Tabs.Tab
        icon="list"
<<<<<<< HEAD
        onClick={() => setTab(TAB.Installed)}
        selected={tab === TAB.Installed}>
=======
        onClick={() => setTab(PAI_TAB.Installed)}
        selected={tab === PAI_TAB.Installed}>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
        Installed
      </Tabs.Tab>
      <Tabs.Tab
        icon="list"
<<<<<<< HEAD
        onClick={() => setTab(TAB.Available)}
        selected={tab === TAB.Available}>
=======
        onClick={() => setTab(PAI_TAB.Available)}
        selected={tab === PAI_TAB.Available}>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
        Download
      </Tabs.Tab>
    </Tabs>
  );
};
