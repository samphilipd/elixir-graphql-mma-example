# priv/repo/seeds.exs

### Fighters

conor = Mma.Repo.insert!(%Mma.Fighter{
  name: "Conor McGregor",
  belts: 2,
  weight_in_kilos: 69.4
})

jon = Mma.Repo.insert!(%Mma.Fighter{
  name: "Jon Jones",
  belts: 0,
  weight_in_kilos: 92.99
})

daniel = Mma.Repo.insert!(%Mma.Fighter{
  name: "Daniel Cormier",
  belts: 1,
  weight_in_kilos: 92.99
})

Mma.Repo.insert!(%Mma.Fighter{
  name: "Demetrious \"Mighty Mouse\" Johnson",
  belts: 1,
  weight_in_kilos: 56.7
})

### Fights

ufc182 = Mma.Repo.insert!(%Mma.Fight{
  name: "UFC 182",
  date: ~D[2015-01-03]
})

ufc214 = Mma.Repo.insert!(%Mma.Fight{
  name: "UFC 214",
  date: ~D[2017-07-29]
})

mcgregor_mayweather = Mma.Repo.insert!(%Mma.Fight{
  name: "McGregor vs. Mayweather",
  date: ~D[2017-08-26]
})

### FightResults

Mma.Repo.insert!(%Mma.FightResult{
  fight_id: ufc182.id,
  fighter_id: jon.id,
  result: "Win"
})

Mma.Repo.insert!(%Mma.FightResult{
  fight_id: ufc182.id,
  fighter_id: daniel.id,
  result: "Loss"
})

Mma.Repo.insert!(%Mma.FightResult{
  fight_id: ufc214.id,
  fighter_id: jon.id,
  result: "Win"
})

Mma.Repo.insert!(%Mma.FightResult{
  fight_id: ufc214.id,
  fighter_id: daniel.id,
  result: "Loss"
})

Mma.Repo.insert!(%Mma.FightResult{
  fight_id: mcgregor_mayweather.id,
  fighter_id: conor.id,
  result: "Loss"
})
