import { useBackend } from '../backend';
import { Box, Button, Section } from '../components';
import { Window } from '../layouts';

export const KeycardAuth = (props, context) => {
  const { act, data } = useBackend(context);
  return (
<<<<<<< HEAD
    // SKYRAT EDIT: height 125 -> 150, addition of permit-locked firing pin
    <Window width={375} height={150}>
=======
    // SKYRAT EDIT: height 125 -> 190, eng override/firing pin
    <Window width={375} height={190}>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
      <Window.Content>
        <Section>
          <Box>
            {data.waiting === 1 && (
              <span>Waiting for another device to confirm your request...</span>
            )}
          </Box>
          <Box>
            {data.waiting === 0 && (
              <>
                {!!data.auth_required && (
                  <Button
                    icon="check-square"
                    color="red"
                    textAlign="center"
                    lineHeight="60px"
                    fluid
                    onClick={() => act('auth_swipe')}
                    content="Authorize"
                  />
                )}
                {data.auth_required === 0 && (
                  <>
                    <Button
                      icon="exclamation-triangle"
                      fluid
                      onClick={() => {
                        return act('red_alert');
                      }}
                      content="Red Alert"
                    />
                    <Button
<<<<<<< HEAD
                      icon="wrench"
=======
                      icon="id-card-o"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
                      fluid
                      onClick={() => act('emergency_maint')}
                      content="Emergency Maintenance Access"
                    />
<<<<<<< HEAD
=======
                    {/* SKYRAT EDIT ADDITION START - Engineering Override */}
                    <Button
                      icon="wrench"
                      fluid
                      onClick={() => act('eng_override')}
                      content="Engineering Override Access"
                    />
                    {/* SKYRAT EDIT ADDITION END */}
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
                    <Button
                      icon="meteor"
                      fluid
                      onClick={() => act('bsa_unlock')}
                      content="Bluespace Artillery Unlock"
                    />
<<<<<<< HEAD
=======
                    {/* SKYRAT EDIT ADDITION START - Permit Pins */}
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
                    {!!data.permit_pins && (
                      <Button
                        icon="key"
                        fluid
                        onClick={() => act('pin_unrestrict')}
                        content="Permit-Locked Firing Pin Unrestriction"
                      />
                    )}
<<<<<<< HEAD
=======
                    {/* SKYRAT EDIT ADDITION END */}
                    <Button
                      icon="key"
                      fluid
                      onClick={() => act('give_janitor_access')}
                      content="Grant Janitor Access"
                    />
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
                  </>
                )}
              </>
            )}
          </Box>
        </Section>
      </Window.Content>
    </Window>
  );
};
