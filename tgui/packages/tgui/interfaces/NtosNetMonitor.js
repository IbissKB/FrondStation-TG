import { useBackend, useSharedState } from '../backend';
<<<<<<< HEAD
import { Box, Button, LabeledList, NoticeBox, NumberInput, Icon, Section, Stack, Tabs } from '../components';
=======
import { Box, Button, LabeledList, NoticeBox, Icon, Section, Stack, Tabs } from '../components';
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
import { NtosWindow } from '../layouts';

export const NtosNetMonitor = (props, context) => {
  const { act, data } = useBackend(context);
  const [tab_main, setTab_main] = useSharedState(context, 'tab_main', 1);
  const {
    ntnetrelays,
<<<<<<< HEAD
    ntnetstatus,
    config_softwaredownload,
    config_communication,
    idsalarm,
    idsstatus,
    ntnetmaxlogs,
    maxlogs,
    minlogs,
=======
    idsalarm,
    idsstatus,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
    ntnetlogs = [],
    tablets = [],
  } = data;
  return (
    <NtosWindow>
      <NtosWindow.Content scrollable>
        <Stack.Item>
          <Tabs>
            <Tabs.Tab
              icon="network-wired"
              lineHeight="23px"
              selected={tab_main === 1}
              onClick={() => setTab_main(1)}>
              NtNet
            </Tabs.Tab>
            <Tabs.Tab
              icon="tablet"
              lineHeight="23px"
              selected={tab_main === 2}
              onClick={() => setTab_main(2)}>
              Tablets ({tablets.length})
            </Tabs.Tab>
          </Tabs>
        </Stack.Item>
        {tab_main === 1 && (
          <Stack.Item>
            <MainPage
              ntnetrelays={ntnetrelays}
<<<<<<< HEAD
              ntnetstatus={ntnetstatus}
              config_softwaredownload={config_softwaredownload}
              config_communication={config_communication}
              idsalarm={idsalarm}
              idsstatus={idsstatus}
              ntnetmaxlogs={ntnetmaxlogs}
              maxlogs={maxlogs}
              minlogs={minlogs}
=======
              idsalarm={idsalarm}
              idsstatus={idsstatus}
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
              ntnetlogs={ntnetlogs}
            />
          </Stack.Item>
        )}
        {tab_main === 2 && (
          <Stack.Item>
            <TabletPage tablets={tablets} />
          </Stack.Item>
        )}
      </NtosWindow.Content>
    </NtosWindow>
  );
};

const MainPage = (props, context) => {
<<<<<<< HEAD
  const {
    ntnetrelays,
    ntnetstatus,
    config_softwaredownload,
    config_communication,
    idsalarm,
    idsstatus,
    ntnetmaxlogs,
    maxlogs,
    minlogs,
    ntnetlogs = [],
  } = props;
=======
  const { ntnetrelays, idsalarm, idsstatus, ntnetlogs = [] } = props;
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  const { act, data } = useBackend(context);
  return (
    <Section>
      <NoticeBox>
        WARNING: Disabling wireless transmitters when using a wireless device
        may prevent you from reenabling them!
      </NoticeBox>
      <Section title="Wireless Connectivity">
<<<<<<< HEAD
        {ntnetrelays ? (
          <LabeledList>
            <LabeledList.Item label="Active NTNet Relays">
              {ntnetrelays}
            </LabeledList.Item>
          </LabeledList>
        ) : (
          'No Relays Connected'
        )}
      </Section>
      <Section title="Firewall Configuration">
        <LabeledList>
          <LabeledList.Item
            label="Software Downloads"
            buttons={
              <Button
                icon={config_softwaredownload ? 'power-off' : 'times'}
                content={config_softwaredownload ? 'ENABLED' : 'DISABLED'}
                selected={config_softwaredownload}
                onClick={() => act('toggle_function', { id: '1' })}
              />
            }
          />
          <LabeledList.Item
            label="Communication Systems"
            buttons={
              <Button
                icon={config_communication ? 'power-off' : 'times'}
                content={config_communication ? 'ENABLED' : 'DISABLED'}
                selected={config_communication}
                onClick={() => act('toggle_function', { id: '2' })}
              />
            }
          />
        </LabeledList>
=======
        {ntnetrelays.map((relay) => (
          <Section
            key={relay.ref}
            title={relay.name}
            buttons={
              <Button.Confirm
                color={relay.is_operational ? 'good' : 'bad'}
                content={relay.is_operational ? 'ENABLED' : 'DISABLED'}
                onClick={() =>
                  act('toggle_relay', {
                    ref: relay.ref,
                  })
                }
              />
            }
          />
        ))}
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
      </Section>
      <Section title="Security Systems">
        {!!idsalarm && (
          <>
            <NoticeBox>NETWORK INCURSION DETECTED</NoticeBox>
            <Box italics>
              Abnormal activity has been detected in the network. Check system
              logs for more information
            </Box>
          </>
        )}
        <LabeledList>
          <LabeledList.Item
            label="IDS Status"
            buttons={
              <>
                <Button
                  icon={idsstatus ? 'power-off' : 'times'}
                  content={idsstatus ? 'ENABLED' : 'DISABLED'}
                  selected={idsstatus}
                  onClick={() => act('toggleIDS')}
                />
                <Button
                  icon="sync"
                  content="Reset"
                  color="bad"
                  onClick={() => act('resetIDS')}
                />
              </>
            }
          />
<<<<<<< HEAD
          <LabeledList.Item
            label="Max Log Count"
            buttons={
              <NumberInput
                value={ntnetmaxlogs}
                minValue={minlogs}
                maxValue={maxlogs}
                width="39px"
                onChange={(e, value) =>
                  act('updatemaxlogs', {
                    new_number: value,
                  })
                }
              />
            }
          />
        </LabeledList>
        <Section
          title="System Log"
          level={2}
=======
        </LabeledList>
        <Section
          title="System Log"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
          buttons={
            <Button.Confirm
              icon="trash"
              content="Clear Logs"
              onClick={() => act('purgelogs')}
            />
          }>
          {ntnetlogs.map((log) => (
            <Box key={log.entry} className="candystripe">
              {log.entry}
            </Box>
          ))}
        </Section>
      </Section>
    </Section>
  );
};

const TabletPage = (props, context) => {
  const { tablets } = props;
  const { act, data } = useBackend(context);
  if (!tablets.length) {
    return <NoticeBox>No tablets detected.</NoticeBox>;
  }
  return (
    <Section>
      <Stack vertical mt={1}>
        <Section fill textAlign="center">
          <Icon name="comment" mr={1} />
          Active Tablets
        </Section>
      </Stack>
      <Stack vertical mt={1}>
        <Section fill>
          <Stack vertical>
            {tablets.map((tablet) => (
              <Section
                key={tablet.ref}
                title={tablet.name}
                buttons={
                  <Button.Confirm
                    icon={tablet.enabled_spam ? 'unlock' : 'lock'}
                    color={tablet.enabled_spam ? 'good' : 'default'}
                    content={
                      tablet.enabled_spam
                        ? 'Restrict Mass PDA'
                        : 'Allow Mass PDA'
                    }
                    onClick={() =>
                      act('toggle_mass_pda', {
                        ref: tablet.ref,
                      })
                    }
                  />
                }
              />
            ))}
          </Stack>
        </Section>
      </Stack>
    </Section>
  );
};
