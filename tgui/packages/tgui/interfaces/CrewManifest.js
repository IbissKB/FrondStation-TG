import { classes } from 'common/react';
import { useBackend } from '../backend';
import { Icon, Section, Table, Tooltip } from '../components';
import { Window } from '../layouts';

const commandJobs = [
  'Head of Personnel',
  'Head of Security',
  'Chief Engineer',
  'Research Director',
  'Chief Medical Officer',
  'Quartermaster', // SKYRAT EDIT
  'Nanotrasen Consultant', // SKYRAT EDIT
];

// SKYRAT EDIT CHANGE BEGIN - ALTERNATIVE_JOB_TITLES
// Any instance of crewMember.trim was originally crewMember.rank
export const CrewManifest = (props, context) => {
  const {
    data: { manifest, positions },
  } = useBackend(context);

  return (
    <Window title="Crew Manifest" width={350} height={500}>
      <Window.Content scrollable>
        {Object.entries(manifest).map(([dept, crew]) => (
          <Section
            className={'CrewManifest--' + dept}
            key={dept}
            title={
              dept +
              (dept !== 'Misc'
                ? ` (${positions[dept].open} positions open)`
                : '')
            }>
            <Table>
              {Object.entries(crew).map(([crewIndex, crewMember]) => (
                <Table.Row key={crewIndex}>
<<<<<<< HEAD
                  <Table.Cell className={'CrewManifest__Cell'}>
=======
                  <Table.Cell
                    className={'CrewManifest__Cell'}
                    maxWidth="135px"
                    overflow="hidden"
                    width="50%">
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
                    {crewMember.name}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      'CrewManifest__Cell',
                      'CrewManifest__Icons',
                    ])}
<<<<<<< HEAD
                    collapsing>
                    {positions[dept].exceptions.includes(crewMember.trim) && (
=======
                    collapsing
                    minWidth="40px"
                    width="40px">
                    {positions[dept].exceptions.includes(crewMember.rank) && (
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
                      <Tooltip content="No position limit" position="bottom">
                        <Icon className="CrewManifest__Icon" name="infinity" />
                      </Tooltip>
                    )}
                    {crewMember.trim === 'Captain' && (
                      <Tooltip content="Captain" position="bottom">
                        <Icon
                          className={classes([
                            'CrewManifest__Icon',
                            'CrewManifest__Icon--Command',
                          ])}
                          name="star"
                        />
                      </Tooltip>
                    )}
                    {commandJobs.includes(crewMember.trim) && (
                      <Tooltip content="Member of command" position="bottom">
                        <Icon
                          className={classes([
                            'CrewManifest__Icon',
                            'CrewManifest__Icon--Command',
                            'CrewManifest__Icon--Chevron',
                          ])}
                          name="chevron-up"
                        />
                      </Tooltip>
                    )}
                  </Table.Cell>
                  <Table.Cell
                    className={classes([
                      'CrewManifest__Cell',
                      'CrewManifest__Cell--Rank',
                    ])}
<<<<<<< HEAD
                    collapsing>
=======
                    collapsing
                    maxWidth="135px"
                    overflow="hidden"
                    width="50%">
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
                    {crewMember.rank}
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          </Section>
        ))}
      </Window.Content>
    </Window>
  );
};
// SKYRAT EDIT CHANGE END - ALTERNATIVE_JOB_TITLES
