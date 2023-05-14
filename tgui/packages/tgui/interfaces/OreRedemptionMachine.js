<<<<<<< HEAD
import { toTitleCase } from 'common/string';
import { useBackend, useLocalState } from '../backend';
import { BlockQuote, Box, Button, NumberInput, Section, Table } from '../components';
import { Window } from '../layouts';

export const OreRedemptionMachine = (props, context) => {
  const { act, data } = useBackend(context);
  const { unclaimedPoints, materials, alloys, diskDesigns, hasDisk } = data;
  return (
    <Window title="Ore Redemption Machine" width={440} height={550}>
      <Window.Content scrollable>
        <Section>
          <BlockQuote mb={1}>
            This machine only accepts ore.
            <br />
            Gibtonite and Slag are not accepted.
          </BlockQuote>
          <Box>
            <Box inline color="label" mr={1}>
              Unclaimed points:
            </Box>
            {unclaimedPoints}
            <Button
              ml={2}
              content="Claim"
              disabled={unclaimedPoints === 0}
              onClick={() => act('Claim')}
            />
          </Box>
        </Section>
        <Section>
          {(hasDisk && (
            <>
              <Box mb={1}>
                <Button
                  icon="eject"
                  content="Eject design disk"
                  onClick={() => act('diskEject')}
                />
              </Box>
              <Table>
                {diskDesigns.map((design) => (
                  <Table.Row key={design.index}>
                    <Table.Cell>
                      File {design.index}: {design.name}
                    </Table.Cell>
                    <Table.Cell collapsing>
                      <Button
                        disabled={!design.canupload}
                        content="Upload"
                        onClick={() =>
                          act('diskUpload', {
                            design: design.index,
                          })
                        }
                      />
                    </Table.Cell>
                  </Table.Row>
                ))}
              </Table>
            </>
          )) || (
            <Button
              icon="save"
              content="Insert design disk"
              onClick={() => act('diskInsert')}
            />
          )}
        </Section>
        <Section title="Materials">
          <Table>
            {materials.map((material) => (
              <MaterialRow
                key={material.id}
                material={material}
                onRelease={(amount) =>
                  act('Release', {
                    id: material.id,
                    sheets: amount,
                  })
                }
              />
            ))}
          </Table>
        </Section>
        <Section title="Alloys">
          <Table>
            {alloys.map((material) => (
              <MaterialRow
                key={material.id}
                material={material}
                onRelease={(amount) =>
                  act('Smelt', {
                    id: material.id,
                    sheets: amount,
                  })
                }
              />
            ))}
          </Table>
        </Section>
=======
import { createSearch, toTitleCase } from 'common/string';
import { useBackend, useLocalState, useSharedState } from '../backend';
import { BlockQuote, Box, Button, Table, Tabs, Input, Stack, Icon, Section, LabeledList } from '../components';
import { Window } from '../layouts';
import { formatSiUnit } from '../format';

export const OreRedemptionMachine = (props, context) => {
  const { act, data } = useBackend(context);
  const { disconnected, unclaimedPoints, materials, user } = data;
  const [tab, setTab] = useSharedState(context, 'tab', 1);
  const [searchItem, setSearchItem] = useLocalState(context, 'searchItem', '');
  const [compact, setCompact] = useSharedState(context, 'compact', false);
  const search = createSearch(searchItem, (materials) => materials.name);
  const material_filtered =
    searchItem.length > 0
      ? data.materials.filter(search)
      : materials.filter((material) => material && material.category === tab);
  return (
    <Window title="Ore Redemption Machine" width={435} height={500}>
      <Window.Content>
        <Stack fill vertical>
          <Section>
            <Stack.Item>
              <Section>
                <Stack>
                  <Stack.Item>
                    <Icon
                      name="id-card"
                      size={3}
                      mr={1}
                      color={user ? 'green' : 'red'}
                    />
                  </Stack.Item>
                  <Stack.Item>
                    <LabeledList>
                      <LabeledList.Item label="Name">
                        {user?.name || 'No Name Detected'}
                      </LabeledList.Item>
                      <LabeledList.Item label="Balance">
                        {user?.cash || 'No Balance Detected'}
                      </LabeledList.Item>
                    </LabeledList>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      textAlign="center"
                      color={compact ? 'red' : 'green'}
                      content="Compact"
                      onClick={() => setCompact(!compact)}
                    />
                  </Stack.Item>
                </Stack>
              </Section>
            </Stack.Item>
          </Section>
          <Section>
            <Stack.Item>
              <Box>
                <Icon name="coins" color="gold" />
                <Box inline color="label" ml={1}>
                  Unclaimed points:
                </Box>
                {unclaimedPoints}
                <Button
                  ml={2}
                  content="Claim"
                  disabled={unclaimedPoints === 0 || disconnected}
                  tooltip={disconnected}
                  onClick={() => act('Claim')}
                />
              </Box>
            </Stack.Item>
          </Section>
          <Section>
            <Stack.Item>
              <BlockQuote>
                This machine only accepts ore. Gibtonite and Slag are not
                accepted.
              </BlockQuote>
            </Stack.Item>
          </Section>
          <Tabs>
            <Tabs.Tab
              icon="list"
              lineHeight="23px"
              selected={tab === 'material'}
              onClick={() => {
                setTab('material');

                if (searchItem.length > 0) {
                  setSearchItem('');
                }
              }}>
              Materials
            </Tabs.Tab>
            <Tabs.Tab
              icon="list"
              lineHeight="23px"
              selected={tab === 'alloy'}
              onClick={() => {
                setTab('alloy');

                if (searchItem.length > 0) {
                  setSearchItem('');
                }
              }}>
              Alloys
            </Tabs.Tab>
            <Input
              autofocus
              position="relative"
              left="25%"
              bottom="5%"
              height="20px"
              width="150px"
              placeholder="Search Material..."
              value={searchItem}
              onInput={(e, value) => {
                setSearchItem(value);

                if (value.length > 0) {
                  setTab(1);
                }
              }}
              fluid
            />
          </Tabs>
          <Stack.Item grow>
            <Section fill scrollable>
              <Table>
                {material_filtered.map((material) => (
                  <MaterialRow
                    key={material.id}
                    material={material}
                    onRelease={(amount) => {
                      if (material.category === 'material') {
                        act('Release', {
                          id: material.id,
                          sheets: amount,
                        });
                      } else {
                        act('Smelt', {
                          id: material.id,
                          sheets: amount,
                        });
                      }
                    }}
                  />
                ))}
              </Table>
            </Section>
          </Stack.Item>
        </Stack>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
      </Window.Content>
    </Window>
  );
};

const MaterialRow = (props, context) => {
<<<<<<< HEAD
  const { material, onRelease } = props;

  const [amount, setAmount] = useLocalState(
    context,
    'amount' + material.name,
    1
  );

  const amountAvailable = Math.floor(material.amount);
  return (
    <Table.Row>
      <Table.Cell>{toTitleCase(material.name).replace('Alloy', '')}</Table.Cell>
      <Table.Cell collapsing textAlign="right">
        <Box mr={2} color="label" inline>
          {material.value && material.value + ' cr'}
        </Box>
      </Table.Cell>
      <Table.Cell collapsing textAlign="right">
        <Box mr={2} color="label" inline>
          {amountAvailable} sheets
        </Box>
      </Table.Cell>
      <Table.Cell collapsing>
        <NumberInput
          width="32px"
          step={1}
          stepPixelSize={5}
          minValue={1}
          maxValue={50}
          value={amount}
          onChange={(e, value) => setAmount(value)}
        />
        <Button
          disabled={amountAvailable < 1}
          content="Release"
          onClick={() => onRelease(amount)}
=======
  const { data } = useBackend(context);
  const { material_icons } = data;
  const { material, onRelease } = props;
  const [compact, setCompact] = useLocalState(context, 'compact', false);

  const display = material_icons.find(
    (mat_icon) => mat_icon.id === material.id
  );

  const sheet_amounts = Math.floor(material.amount);
  const print_amount = 5;
  const max_sheets = 50;

  return (
    <Table.Row className="candystripe" collapsing>
      {!compact && (
        <Table.Cell collapsing>
          <Box
            as="img"
            m={1}
            src={`data:image/jpeg;base64,${display.product_icon}`}
            height="18px"
            width="18px"
            style={{
              '-ms-interpolation-mode': 'nearest-neighbor',
              'vertical-align': 'middle',
            }}
          />
        </Table.Cell>
      )}
      <Table.Cell>{toTitleCase(material.name)}</Table.Cell>
      <Table.Cell collapsing textAlign="left">
        <Box color="label">
          {formatSiUnit(sheet_amounts, 0)}{' '}
          {material.amount === 1 ? 'sheet' : 'sheets'}
        </Box>
      </Table.Cell>
      <Table.Cell collapsing textAlign="left">
        <Button
          content="x1"
          color="transparent"
          tooltip={material.value ? material.value + ' cr' : 'No cost'}
          onClick={() => onRelease(1)}
        />
        <Button
          content={'x' + print_amount}
          color="transparent"
          tooltip={
            material.value ? material.value * print_amount + ' cr' : 'No cost'
          }
          onClick={() => onRelease(print_amount)}
        />
        <Button.Input
          content={
            '[Max: ' +
            (sheet_amounts < max_sheets ? sheet_amounts : max_sheets) +
            ']'
          }
          color={'transparent'}
          maxValue={max_sheets}
          onCommit={(e, value) => {
            onRelease(value);
          }}
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
        />
      </Table.Cell>
    </Table.Row>
  );
};
