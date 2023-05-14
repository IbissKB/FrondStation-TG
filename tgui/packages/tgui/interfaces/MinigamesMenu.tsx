import { useBackend } from '../backend';
import { Button, Section, Stack } from '../components';
import { Window } from '../layouts';

export const MinigamesMenu = (props, context) => {
  const { act } = useBackend(context);

  return (
<<<<<<< HEAD
    <Window title="Minigames Menu" width={450} height={200}>
=======
    <Window title="Minigames Menu" width={700} height={200}>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
      <Window.Content>
        <Section title="Select Minigame" textAlign="center">
          <Stack>
            <Stack.Item grow>
              <Button
                content="CTF"
                fluid={1}
                fontSize={3}
                textAlign="center"
                lineHeight="3"
                onClick={() => act('ctf')}
              />
            </Stack.Item>
            <Stack.Item grow>
              <Button
                content="Mafia"
                fluid={1}
                fontSize={3}
                textAlign="center"
                lineHeight="3"
                onClick={() => act('mafia')}
              />
            </Stack.Item>
<<<<<<< HEAD
=======
            <Stack.Item grow>
              <Button
                content="Basketball"
                fluid={1}
                fontSize={3}
                textAlign="center"
                lineHeight="3"
                onClick={() => act('basketball')}
              />
            </Stack.Item>
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
