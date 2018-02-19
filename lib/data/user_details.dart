class UserDetails {
  final String login;
  final int id;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;
  final String name;
  final String company;
  final String blog;
  final String location;
  final String email;
  final bool hireable;
  final String bio;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDetails(
      this.login,
      this.id,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.hireable,
      this.bio,
      this.publicRepos,
      this.publicGists,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt);

  UserDetails.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        id = json['id'],
        avatarUrl = json['avatar_url'],
        gravatarId = json['gravatar_id'],
        url = json['url'],
        htmlUrl = json['html_url'],
        followersUrl = json['followers_url'],
        followingUrl = json['following_url'],
        gistsUrl = json['gists_url'],
        starredUrl = json['starred_url'],
        subscriptionsUrl = json['subscriptions_url'],
        organizationsUrl = json['organizations_url'],
        reposUrl = json['repos_url'],
        eventsUrl = json['events_url'],
        receivedEventsUrl = json['receivedEvents_url'],
        type = json['type'],
        siteAdmin = json['site_admin'],
        name = json['name'],
        company = json['company'],
        blog = json['blog'],
        location = json['location'],
        email = json['email'],
        hireable = json['hireable'],
        bio = json['bio'],
        publicRepos = json['public_repos'],
        publicGists = json['public_gists'],
        followers = json['followers'],
        following = json['following'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'];
}
