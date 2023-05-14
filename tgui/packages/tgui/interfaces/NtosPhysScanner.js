import { useBackend } from '../backend';
import { NtosWindow } from '../layouts';
<<<<<<< HEAD
import { Section, Box, Dropdown } from '../components';
=======
import { Section, Box } from '../components';
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
import { sanitizeText } from '../sanitize';

export const NtosPhysScanner = (props, context) => {
  const { act, data } = useBackend(context);
<<<<<<< HEAD
  const { set_mode, last_record, available_modes = [] } = data;
=======
  const { last_record } = data;
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
  const textHtml = {
    __html: sanitizeText(last_record),
  };
  return (
    <NtosWindow width={600} height={350}>
      <NtosWindow.Content scrollable>
        <Section>
          Tap something (right-click) with your tablet to use the physical
          scanner.
        </Section>
        <Section>
          <Box bold>
<<<<<<< HEAD
            SELECTED MODE <br /> <br />
          </Box>
          <Dropdown
            options={available_modes}
            selected={set_mode}
            onSelected={(value) =>
              act('selectMode', {
                newMode: value,
              })
            }
          />
        </Section>
        <Section>
          <Box bold>
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
            LAST SAVED RESULT
            <br />
            <br />
          </Box>
          <Box
            style={{ 'white-space': 'pre-line' }}
            dangerouslySetInnerHTML={textHtml}
          />
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
