class Character < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true

  professions = ['Aerobat', 'Antarian Ranger', 'Big Game Hunter', 'Bodyguard',
              'Bounty Hunter', 'Changeling', 'Chief Engineer', 'Crime Lord',
              'Deep Space Pilot', 'Elite Trooper', 'Holovid Star', 'Infiltrator',
              'Loyal Protector', 'Martial Arts Master', 'Master Duelist', 'Master Gunner',
              'Master Spy', 'Naval Officer', 'Officer', 'Outlaw Slicer', 'Priest', 'Sharpshooter',
              'Sienar Engineer', 'Starship Ace', 'Treasure Hunter', 'Assassin',
              'Jedi Ace', 'Jedi Artisan', 'Jedi Healer', 'Jedi Instructor', 'Jedi Investigator', 'Jedi Master',
              'Jedi Scholar', 'Jedi Watchman', 'Jedi Weapon Master', 'Beastwarden', 'Force Witch', 'Force Warrior',
              'Berserker Droid', 'Black Sun Enforcer', 'Black Sun Vigo', 'Corporate Troubleshooter', 'Corporate Viceprex',
              'CorSec Officer', 'Crime Broker', 'Espionage Droid', 'Lord of the Expanse', 'Senate Guard', 'Shadow Wing Captain',
              'Dark Side Assassin', 'Dark Side Devotee', 'Dark Side Marauder', 'Sith Acolyte', 'Sith Lord', 'Sith Warrior']

end
